
-- Description:

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
library std;                  -- for Printing
use std.textio.all;

use work.math_pkg.all;

entity cicada_ad_hi_condition_TB is
end cicada_ad_hi_condition_TB;

architecture rtl of cicada_ad_hi_condition_TB is

    constant LHC_CLK_PERIOD  : time :=  25.2 ns;

    signal lhc_clk : std_logic;

    signal cicada_dec : std_logic_vector(7 downto 0) := X"00";
    signal cicada_int : std_logic_vector(7 downto 0) := X"00";
    signal cicada_i : std_logic_vector(15 downto 0) := X"0000";

begin

    -- Clock
    lhc_clk_p: process
    begin
        lhc_clk  <=  '1';
        wait for LHC_CLK_PERIOD/2;
        lhc_clk  <=  '0';
        wait for LHC_CLK_PERIOD/2;
    end process;


    stimuli_p: process
    begin
        wait for 2*LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"04";
        wait for LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"00";
        wait for 2*LHC_CLK_PERIOD;
        cicada_dec <= X"05";
        cicada_int <= X"03";
        wait for LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"00";
        wait for 2*LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"03";
        wait for LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"00";
        wait for 2*LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"02";
        wait for LHC_CLK_PERIOD;
        cicada_dec <= X"00";
        cicada_int <= X"00";
        wait;
    end process;

 ------------------- Instantiate  modules  -----------------
 
    cicada_i(15 downto 8) <= cicada_int;
    cicada_i(7 downto 0) <= cicada_dec;

    dut: entity work.cicada_condition
        generic map(
            ad_thr => X"0300"
        )
        port map(
            lhc_clk => lhc_clk,
            ad_i => cicada_i,
            ad_comp_o => open
        );
end rtl;
