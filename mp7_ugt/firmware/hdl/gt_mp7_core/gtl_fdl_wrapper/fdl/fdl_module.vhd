--------------------------------------------------------------------------------
-- Synthesizer : ISE 14.6
-- Platform    : Linux Ubuntu 10.04
-- Targets     : Synthese
--------------------------------------------------------------------------------
-- This work is held in copyright as an unpublished work by HEPHY (Institute
-- of High Energy Physics) All rights reserved.  This work may not be used
-- except by authorized licensees of HEPHY. This work is the
-- confidential information of HEPHY.
--------------------------------------------------------------------------------
-- $HeadURL: svn://heros.hephy.at/GlobalTriggerUpgrade/firmware/gt_mp7/branches/hb_algo_2_buffer/src/gt_mp7_core/gtl_fdl_wrapper/fdl/fdl_module.vhd $
-- $Date: 2015-08-14 10:57:16 +0200 (Fre, 14 Aug 2015) $
-- $Author: bergauer $
-- $Revision: 4148 $
--------------------------------------------------------------------------------

-- Desription:
-- FDL structure

-- Version-history:
-- HB 2015-08-14: v0.0.13 - based on v0.0.12, but added algo_bx_mask_sim input for simulation use. Send a delayed "finor_with_veto" (currently assumed 1.5 bx latency over FINOR-AMC502)
--                          to ports "finor_2_mezz_lemo" and "veto_2_mezz_lemo", which go to MP7-mezzanine to send finor gated with veto to TCDS directly (without AMC502).
-- HB 2015-06-26: v0.0.12 - based on v0.0.11, but used an additional port "veto_2_mezz_lemo", which goes to MP7-mezzanine (with 3 LEMOs) to send finor and veto to FINOR-FMC on AMC502. 
-- HB 2015-05-29: v0.0.11 - based on v0.0.10, but renamed port "ser_finor_veto" to "finor_2_mezz_lemo" and inserted FDL_OUT_MEZZ_2_TCDS in generic. 
-- HB 2015-05-26: v0.0.10 - based on v0.0.9, but inserted SIM_MODE for algo_bx_mask and instanciated all modules with "entity work.xxx" and used clk160 for "serializer_2_to_1.vhd". 
-- HB 2014-12-15: v0.0.9 - based on v0.0.8, but bug fixed at "local_finor_with_veto_o" (removed FF). 
-- HB 2014-12-10: v0.0.8 - based on v0.0.7, but removed serializer. 
-- HB 2014-12-10: v0.0.7 - based on v0.0.6, but clk160 used for serializer. 
-- HB 2014-11-21: v0.0.6 - based on v0.0.5, but implemented "ser_finor_veto_2_to_1" (only"local FINOR" and "local VETO" serialized) 
--                         and "sel_finor_lemo_out" for selection of signal to finor LEMO output (on FINOR-mezzanine).
-- HB 2014-11-18: v0.0.5 - based on v0.0.4, but "sel_local_finor_with_veto" instead of "sel_ser_finor_veto".
-- HB 2014-10-30: v0.0.4 - based on v0.0.3, but added local_finor_with_veto_o for SPY2_FINOR.
-- HB 2014-10-22: v0.0.3 - based on v0.0.2, but redesigned FINOR logic and added serializer for "local FINOR" and "local VETO" to send these signals to "FINOR-FMC".
-- HB 11-08-2014: v0.0.2 - instantiate all algo_bx_mem instead of NR_ALGOS dependecies by a fixed value (0 to 15).
-- BR 08-08-2014: instantiate all algo_bx_mem instead of NR_ALGOS dependecies.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL; -- for function "CONV_INTEGER"

use work.ipbus.all;
use work.fdl_pkg.ALL;
use work.gtl_pkg.ALL;

use work.gt_mp7_core_pkg.ALL;
use work.fdl_addr_decode.all;

entity fdl_module is
    generic(
        SIM_MODE : boolean := false; -- if SIM_MODE = true, "algo_bx_mask" by default all '1'.
-- HB 2015-06-26: v0.0.12 - based on v0.0.11, but used an additional port "veto_2_mezz_lemo", which goes to MP7-mezzanine (with 3 LEMOs) to send finor and veto to FINOR-FMC on AMC502.
--                FDL_OUT_MEZZ_2_TCDS not used anymore.
--         FDL_OUT_MEZZ_2_TCDS : boolean := false; -- if FDL_OUT_MEZZ_2_TCDS = true, "local_finor_with_veto" send to LEMO on mezzanine for TCDS.
        PRESCALE_FACTOR_INIT : ipb_regs_array(0 to MAX_NR_ALGOS-1) := (others => X"00000001");
        MASKS_INIT : ipb_regs_array(0 to MAX_NR_ALGOS-1) := (others => X"00000001")
    );
    port(
        ipb_clk             : in std_logic;
        ipb_rst             : in std_logic;
        ipb_in              : in ipb_wbus;
        ipb_out             : out ipb_rbus;
-- ==========================================================================
-- HB 2015-06-26: v0.0.12 - based on v0.0.11, but used an additional port "veto_2_mezz_lemo", which goes to MP7-mezzanine (with 3 LEMOs) to send finor and veto to FINOR-FMC on AMC502.
--                clk160 not used anymore.
--         clk160              : in std_logic;
        lhc_clk             : in std_logic;
        lhc_rst             : in std_logic;
        bcres               : in std_logic;
        lhc_gap             : in std_logic;
        begin_lumi_section  : in std_logic;
        bx_nr               : in std_logic_vector(11 downto 0);
        algo_i              : in std_logic_vector(NR_ALGOS-1 downto 0);
        fdl_status          : out std_logic_vector(3 downto 0);
        prescale_factor_set_index_rop : out std_logic_vector(7 downto 0);
        algo_before_prescaler_rop     : out std_logic_vector(MAX_NR_ALGOS-1 downto 0);
        algo_after_prescaler_rop      : out std_logic_vector(MAX_NR_ALGOS-1 downto 0);
        algo_after_finor_mask_rop     : out std_logic_vector(MAX_NR_ALGOS-1 downto 0);
        local_finor_rop     : out std_logic;
        local_veto_rop      : out std_logic;
        finor_2_mezz_lemo      : out std_logic;
        veto_2_mezz_lemo      : out std_logic;
        local_finor_with_veto_o       : out std_logic; -- to SPY2_FINOR
-- HB 2015-08-14: v0.0.13 - algo_bx_mask_sim input for simulation use.
        algo_bx_mask_sim    : in std_logic_vector(NR_ALGOS-1 downto 0)
    );
end fdl_module;

architecture rtl of fdl_module is

-- HB 2015-05-26: "switch" for mux of signal to LEMO on mezzanine board
-- HB 2015-06-02: FDL_OUT_MEZZ_2_TCDS moved to generic
--     constant FDL_OUT_MEZZ_2_TCDS : boolean := false;

    constant CNTRL_REG_INIT : ipb_regs_array(0 downto 0) := (others => X"00000000");

    signal ipb_to_slaves: ipb_wbus_array(NR_IPB_SLV_FDL-1 downto 0);
    signal ipb_from_slaves: ipb_rbus_array(NR_IPB_SLV_FDL-1 downto 0);

    signal rate_cnt_before_prescaler_reg: ipb_regs_array(0 to OFFSET_END_RATE_CNT_BEFORE_PRESCALER-OFFSET_BEG_RATE_CNT_BEFORE_PRESCALER);
    signal prescale_factor_reg: ipb_regs_array(0 to OFFSET_END_PRESCALE_FACTOR-OFFSET_BEG_PRESCALE_FACTOR);
    signal masks_reg: ipb_regs_array(0 to OFFSET_END_MASKS-OFFSET_BEG_MASKS);
    signal versions_to_ipb: ipb_regs_array(0 to OFFSET_END_READ_VERSIONS-OFFSET_BEG_READ_VERSIONS) := (others => (others => '0'));
    signal control_reg: ipb_regs_array(0 to 0);

-- =================================================================================
    signal finor_masks_int : std_logic_vector(NR_ALGOS-1 downto 0);
    signal veto_masks_int : std_logic_vector(NR_ALGOS-1 downto 0);

    signal algo_int : std_logic_vector(NR_ALGOS-1 downto 0) := (others => '0');
    signal sres_prescaler : std_logic := '0';
    signal prescale_factor_int : prescale_factor_array;
    signal sres_rate_counter : std_logic := '0';
    signal rate_cnt_before_prescaler : rate_counter_array;

    signal algo_before_prescaler : std_logic_vector(NR_ALGOS-1 downto 0) := (others => '0');
    signal algo_after_prescaler : std_logic_vector(NR_ALGOS-1 downto 0) := (others => '0');
    signal algo_after_finor_mask : std_logic_vector(NR_ALGOS-1 downto 0);
    signal veto : std_logic_vector(NR_ALGOS-1 downto 0);
    signal local_finor : std_logic := '0';
    signal local_veto : std_logic := '0';
    signal local_finor_pipe : std_logic;
    signal local_veto_pipe : std_logic;
    signal algo_bx_mask : std_logic_vector(MAX_NR_ALGOS-1 downto 0) := (others => '1');
    signal algo_bx_mask_mem_out : std_logic_vector(MAX_NR_ALGOS-1 downto 0) := (others => '1');
    signal algo_bx_mask_default : std_logic_vector(MAX_NR_ALGOS-1 downto 0) := (others => '1');
    signal algo_bx_mask_sim_internal : std_logic_vector(MAX_NR_ALGOS-1 downto 0) := (others => '1');

    signal lhc_clk_algo_bx_mem : std_logic := '0';
    signal sync_en_algo_bx_mem : std_logic := '0';

    signal request_update_factor_pulse : std_logic;

    signal clk_80mhz : std_logic;
-- HB 2015-06-26: v0.0.12 - based on v0.0.11, but used an additional port "veto_2_mezz_lemo", which goes to MP7-mezzanine (with 3 LEMOs) to send finor and veto to FINOR-FMC on AMC502.
--                ser_finor_veto_2_to_1_int not used anymore.
--     signal ser_finor_veto_2_to_1_int : std_logic;

--                local_finor_with_veto not used anymore.
-- HB 2014-10-23: local_finor_with_veto for tests
--     signal local_finor_with_veto : std_logic;

    signal finor_with_veto_temp1 : std_logic;
    signal finor_with_veto_temp2 : std_logic;

begin

-- HB 2015-06-02: to do => insert a register for "prescale_factor_set_index" for output "prescale_factor_set_index_rop"
    prescale_factor_set_index_rop <= X"00";

-- ******************************************************************************************************************
-- HB 04-09-2013: FDL status (similar to status information send to DAQ partitions via TCS)
-- fdl_status(3) = "ready"
-- fdl_status(2) = "busy"
-- fdl_status(1) = "error/out_of_sync"
-- fdl_status(0) = "warning"

-- HB 04-09-2013: if we have more than one uGT board, a "error" could be, if the connections for external FINORs and VETOs are not ok!!!
-- Requirement: the connection must be done in a certain way, so that board_connections signals are used from 1 to MAX_NR_GT_BOARDS-1 without gaps.
-- fdl_status <= X"8"; -- "ready"
-- fdl_status <= X"2"; -- "error"

-- board_connections_int <= board_connections & '1'; -- board(0) (=FINOR board) always "connected".
-- 
-- fdl_status <= X"8" when finor_mezz_board = '0' else -- status = "ready", if this board is not a total-FINOR board
--               X"8" when finor_mezz_board = '1' and (board_connections_int(USED_GT_BOARDS-1 downto 0) = board_connections_check(USED_GT_BOARDS-1 downto 0)) else
--               X"2";

-- HB 17-09-2013: board_connections should be in a status register !!!

-- HB 2014-10-22:
-- A redesign of FINOR is done, so no more board_connection check.
    fdl_status <= X"8"; -- status of FDL has to be designed, here set to "ready"

-- ******************************************************************************************************************
    fabric_i: entity work.fdl_fabric
        generic map(NSLV => NR_IPB_SLV_FDL)
        port map(
            ipb_clk => ipb_clk,
            ipb_rst => ipb_rst,
            ipb_in => ipb_in,
            ipb_out => ipb_out,
            ipb_to_slaves => ipb_to_slaves,
            ipb_from_slaves => ipb_from_slaves
    );

--===============================================================================================--
-- Version register
    read_versions_i: entity work.ipb_read_regs
    generic map
    (
        addr_width => ADDR_WIDTH_READ_VERSIONS,
        regs_beg_index => OFFSET_BEG_READ_VERSIONS,
        regs_end_index => OFFSET_END_READ_VERSIONS
    )
    port map
    (
        clk => ipb_clk,
        reset => ipb_rst,
        ipbus_in => ipb_to_slaves(C_IPB_READ_VERSIONS),
        ipbus_out => ipb_from_slaves(C_IPB_READ_VERSIONS),
        ------------------
        regs_i => versions_to_ipb
    );

    l1tm_name_l: for i in 0 to L1TM_NAME'length/32-1 generate
		versions_to_ipb(i+OFFSET_L1TM_NAME) <= L1TM_NAME(i*32+31 downto i*32);
    end generate l1tm_name_l;                        

    l1tm_uid_l: for i in 0 to L1TM_UID'length/32-1 generate
		versions_to_ipb(i+OFFSET_L1TM_UID) <= L1TM_UID(i*32+31 downto i*32);
    end generate l1tm_uid_l;                        

	versions_to_ipb(OFFSET_L1TM_COMPILER_VERSION) <= L1TM_COMPILER_VERSION;
	versions_to_ipb(OFFSET_GTL_FW_VERSION) <= GTL_FW_VERSION;
	versions_to_ipb(OFFSET_FDL_FW_VERSION) <= FDL_FW_VERSION;

--===============================================================================================--
-- Control register
    control_reg_i: entity work.ipb_write_regs
    generic map
    (
        init_value => CNTRL_REG_INIT,
        addr_width => 1,
        regs_beg_index => 0,
        regs_end_index => 0
    )
    port map
    (
        clk => ipb_clk,
        reset => ipb_rst,
        ipbus_in => ipb_to_slaves(C_IPB_CONTROL),
        ipbus_out => ipb_from_slaves(C_IPB_CONTROL),
        ------------------
        regs_o => control_reg
    );

--    reset_algo_bx_mem <= control_reg(0)(0); -- Control register bit 0 => reset algo-bx-memory port B
-- HB 2014-12-11: dummy, not used in algo-bx-memory
--      en_algo_bx_mem <= control_reg(0)(1); -- Control register bit 1 => enable input (enb) algo-bx-memory port B
-- HB 2014-12-11: not used in this version
-- Control register bit 3 and 2 => selection for "sel_finor_lemo_out": "00" => local_finor_with_veto, "01" => ser_finor_veto_4_to_1.
-- 	sel_finor_lemo_out <= control_reg(0)(3 downto 2);

--===============================================================================================--
-- Algo-bx-memory
-- HB 11.08.2014 - 16 memory-blocks instantiated, same as defined in XML for addresses
    algo_bx_mem_l: for i in 0 to 15 generate
        algo_bx_mem_i: entity work.ipb_dpmem_4096_32
        port map
        (
            ipbus_clk => ipb_clk,
            reset     => ipb_rst,
            ipbus_in  => ipb_to_slaves(C_IPB_ALGO_BX_MEM(i)),
            ipbus_out => ipb_from_slaves(C_IPB_ALGO_BX_MEM(i)),
            ------------------
            clk_b     => lhc_clk,
            enb       => '1',
--             enb       => en_algo_bx_mem,
            web       => '0', -- read
            addrb     => bx_nr(11 downto 0),
            dinb      => X"FFFFFFFF", -- dummy
            doutb     => algo_bx_mask_mem_out(32*i+31 downto 32*i)
        );
    end generate algo_bx_mem_l;                        

    algo_bx_mask_sim_internal(NR_ALGOS-1 downto 0) <= algo_bx_mask_sim(NR_ALGOS-1 downto 0);
    
-- HB 2015-08-14: v0.0.13 - algo_bx_mask_sim input for simulation use.
    algo_bx_mask <= algo_bx_mask_mem_out when not SIM_MODE else
		    algo_bx_mask_sim_internal when SIM_MODE else (others => '1');
    
--===============================================================================================--
-- Rate counter before prescaler register
    read_rate_cnt_i: entity work.ipb_read_regs
    generic map
    (
        addr_width => ADDR_WIDTH_RATE_CNT_BEFORE_PRESCALER,
        regs_beg_index => OFFSET_BEG_RATE_CNT_BEFORE_PRESCALER,
        regs_end_index => OFFSET_END_RATE_CNT_BEFORE_PRESCALER
    )
    port map
    (
        clk => ipb_clk,
        reset => ipb_rst,
        ipbus_in => ipb_to_slaves(C_IPB_RATE_CNT_BEFORE_PRESCALER),
        ipbus_out => ipb_from_slaves(C_IPB_RATE_CNT_BEFORE_PRESCALER),
        ------------------
        regs_i => rate_cnt_before_prescaler_reg
    );

--===============================================================================================--
-- Prescale factor registers
    prescale_factor_reg_i: entity work.ipb_write_regs
    generic map
    (
        init_value => PRESCALE_FACTOR_INIT,
        addr_width => ADDR_WIDTH_PRESCALE_FACTOR,
        regs_beg_index => OFFSET_BEG_PRESCALE_FACTOR,
        regs_end_index => OFFSET_END_PRESCALE_FACTOR
    )
    port map
    (
        clk => ipb_clk,
        reset => ipb_rst,
        ipbus_in => ipb_to_slaves(C_IPB_PRESCALE_FACTOR),
        ipbus_out => ipb_from_slaves(C_IPB_PRESCALE_FACTOR),
        ------------------
        regs_o => prescale_factor_reg
    );

-- --===============================================================================================--
-- Finor and veto masks registers (bit 0 = finor, bit 1 = veto)
    masks_reg_i: entity work.ipb_write_regs
    generic map
    (
        init_value => MASKS_INIT,
        addr_width => ADDR_WIDTH_MASKS,
        regs_beg_index => OFFSET_BEG_MASKS,
        regs_end_index => OFFSET_END_MASKS
    )
    port map
    (
        clk => ipb_clk,
        reset => ipb_rst,
        ipbus_in => ipb_to_slaves(C_IPB_MASKS),
        ipbus_out => ipb_from_slaves(C_IPB_MASKS),
        ------------------
        regs_o => masks_reg
    );

-- --===============================================================================================--

    reg_l: for i in 0 to NR_ALGOS-1 generate
        rate_cnt_before_prescaler_reg(i)(RATE_COUNTER_WIDTH-1 downto 0) <= rate_cnt_before_prescaler(i);
        prescale_factor_int(i) <= prescale_factor_reg(i);
        finor_masks_int(i) <= masks_reg(i)(0);
        veto_masks_int(i) <= masks_reg(i)(1);
    end generate reg_l;

-- ******************************************************************************************************************
-- FDL data flow - begin

-- Input register for algorithms inputs (used for timing analysis of fdl_module).
    algo_in_ff_p: process(lhc_clk, algo_i)
        begin
        if (algo_inputs_ff = false) then 
            algo_int <= algo_i;
        elsif (lhc_clk'event and (lhc_clk = '1') and (algo_inputs_ff = true)) then
            algo_int <= algo_i;
        end if;
    end process;

-- Prescalers and rate counters
    algo_slices_l: for i in 0 to NR_ALGOS-1 generate
        algo_slice_i: entity work.algo_slice
        generic map( 
            RATE_COUNTER_WIDTH => RATE_COUNTER_WIDTH,
            PRESCALER_COUNTER_WIDTH => PRESCALER_COUNTER_WIDTH,
            PRESCALE_FACTOR_INIT => PRESCALE_FACTOR_INIT(i)
        )
        port map( 
            sys_clk => ipb_clk,
            lhc_clk => lhc_clk,
            request_update_factor_pulse => request_update_factor_pulse,
            begin_lumi_per => begin_lumi_section,
            algo_i => algo_int(i),
            prescale_factor => prescale_factor_int(i)(PRESCALER_COUNTER_WIDTH-1 downto 0),
            algo_bx_mask => algo_bx_mask(i),
            finor_mask => finor_masks_int(i),
            veto_mask => veto_masks_int(i),
            rate_cnt_before_prescaler => rate_cnt_before_prescaler(i),
--         rate_cnt_after_mask => rate_cnt_after_mask(i),
            algo_before_prescaler => algo_before_prescaler(i),
            algo_after_prescaler => algo_after_prescaler(i),
	    algo_after_finor_mask => algo_after_finor_mask(i),
	    veto => veto(i)
	);

-- ********************************************
-- FDL data flow - begin

    end generate algo_slices_l;

-- HB 2014-10-23: renamed
-- Finor of algorithms
-- finor_masked_algo_p: process(algo_after_finor_mask)
    local_finor_p: process(algo_after_finor_mask)
       variable or_algo_var : std_logic := '0';
    begin
        or_algo_var := '0';
            for i in 0 to NR_ALGOS-1 loop
                or_algo_var := or_algo_var or algo_after_finor_mask(i);
            end loop;
    --     finor_algo <= or_algo_var;
        local_finor <= or_algo_var;
    end process local_finor_p;
    
-- HB 2014-10-23: renamed
-- Finor of vetos
-- finor_veto_algo_p: process(veto)
    local_veto_or_p: process(veto)
        variable or_veto_var : std_logic := '0';
    begin
        or_veto_var := '0';
            for i in 0 to NR_ALGOS-1 loop
                or_veto_var := or_veto_var or veto(i); 
            end loop;
--     finor_veto <= or_veto_var;
	local_veto <= or_veto_var;
    end process local_veto_or_p;

-- One pipeline stage for finor and veto to ROP
    local_finor_veto_pipeline_p: process(lhc_clk, local_finor, local_veto)
        begin
        if (lhc_clk'event and (lhc_clk = '1')) then
            local_finor_pipe <= local_finor;
            local_veto_pipe <= local_veto;
        end if;
    end process;

    local_finor_rop <= local_finor_pipe;
    local_veto_rop <= local_veto_pipe;
        
-- HB 2014-12-15: bug fixed - local_finor_with_veto used for finor_2_mezz_lemo not for SPY2_FINOR !!!
    local_finor_with_veto_o <= local_finor_pipe and not local_veto_pipe;

-- Pipeline stages for "simulating" the stages of FINOR-AMC502, to get the same latency for both possibilities of connecting to TCDS.
-- HB 2015-08-21: currently assumed 1.5 bx latency over FINOR-AMC502

    stage1_finor_amc502_sim_p: process(lhc_clk, local_finor, local_veto)
        begin
        if (lhc_clk'event and (lhc_clk = '1')) then
            finor_with_veto_temp1 <= local_finor and not local_veto;
            finor_with_veto_temp2 <= finor_with_veto_temp1;
        end if;
    end process;

--     stage2_finor_amc502_sim_p: process(lhc_clk, finor_with_veto_temp2)
--         begin
--         if (lhc_clk'event and (lhc_clk = '0')) then
--             finor_with_veto_2_mezz_lemo <= finor_with_veto_temp2;
--         end if;
--     end process;

-- Output FFs should be placed in IOBs - to be done in UCF
-- HB 2015-08-21: for begin of "Parallel Run" (Sept. 2015), finor_2_mezz_lemo _AND_ veto_2_mezz_lemo send the veto-gated finor to TCDS (without FINOR-AMC502) !!!
    mezz_finor_veto_pipeline_p: process(lhc_clk, finor_with_veto_temp2)
        begin
        if (lhc_clk'event and (lhc_clk = '0')) then
            finor_2_mezz_lemo <= finor_with_veto_temp2;
            veto_2_mezz_lemo <= finor_with_veto_temp2;
        end if;
    end process;

--     finor_2_mezz_lemo <= local_finor_pipe;
--     veto_2_mezz_lemo <= local_veto_pipe;

-- FDL data flow - end
-- ********************************************

-- Algorithms to ROP
    algo_mapping_rop_i: entity work.algo_mapping_rop
        port map ( 
            lhc_clk => lhc_clk,
            algo_before_prescaler => algo_before_prescaler,
            algo_after_prescaler => algo_after_prescaler,
            algo_after_finor_mask => algo_after_finor_mask,
            algo_before_prescaler_rop => algo_before_prescaler_rop,
            algo_after_prescaler_rop => algo_after_prescaler_rop,
            algo_after_finor_mask_rop => algo_after_finor_mask_rop
        );
    
end architecture rtl;
    
    