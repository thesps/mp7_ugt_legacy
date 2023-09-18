-- Description:
-- Package for constant and type definitions of GTL firmware in Global Trigger Upgrade system.

-- Version history:
-- HB 2023-09-13: NR_INPUT_LANES not used anymore. Added type lword_array (for output_mux.vhd and mux.vhd)
-- HB 2023-07-28: bug fixed "type zdc_array ...".
-- HB 2023-07-25: new ZDC data structure.
-- HB 2023-03-06: added hadronic shower trigger bit MUS2.
-- HB 2023-03-01: updated constants for ZDC.
-- HB 2022-10-17: added constant NR_INPUT_LANES (for reduced NR_LANES in frame.vhd).
-- HB 2022-10-10: added ZDC definitions. Removed constant SCOUTING.
-- HB 2022-09-23: added constants ESUMS_COND_STAGES, MB_COND_STAGES and TC_COND_STAGES.
-- HB 2022-09-02: cleaned up.
-- HB 2021-10-19: inserted jet DISP (displaced) bit 27 (and all dependencies on this bit).
-- HB 2021-08-12: added selectors (constants) for SCOUTING and SPYMEM (usae of input spy memory).
-- HB 2021-06-10: added hadronic shower trigger bits (muon).
-- HB 2021-05-21: added constants and types for bx arrays.
-- HB 2021-05-18: moved LUTs to gtl_luts_pkg.vhd. Removed D_S_I types.
-- HB 2021-05-14: moved "ugt_constants" replacement to fdl_pkg_tpl.vhd. New file name.
-- HB 2021-04-23: cleaned up types, constants and comments.
-- HB 2021-04-22: inserted constants for "CALO_CALO_COSH_COS_VECTOR_WIDTH", etc. instead of "EG_EG_COSH_COS_VECTOR_WIDTH", etc. Similarly done for COSH_COS_PRECISION, MASS_DIV_DR_VECTOR_WIDTH and SIN_COS_PRECISION. Cleaned up.
-- HB 2021-04-19: removed obsolete constants for LUTs.
-- HB 2021-04-13: added type "tbpt_dim2_array".
-- HB 2021-02-25: removed unused types (calo_deta_bin_vector_array, muon_deta_bin_vector_array, calo_dphi_bin_vector_array, muon_dphi_bin_vector_array).
-- HB 2021-02-18: additional constants and types (for cosh_deta_cos_dphi.vhd).
-- HB 2021-02-16: additional constants for HTMHF.
-- HB 2021-02-11: added constant for intermediate pipeline in conditions.
-- HB 2021-01-25: added constants for bit width and types of all object cuts (MAX_PT_BITS, etc., renamed MAX_MUON_PHI_BITS to MUON_PHI_BITS).
-- HB 2021-01-22: added constant (MAX_OBJECT_BITS) and type (common_objects_array).
-- HB 2020-06-26: added constants for rom width (for invariant mass divided by deltaR).
-- HB 2020-06-17: cleaned up constants for invariant mass divided by deltaR.
-- HB 2020-06-17: added constants for invariant mass divided by deltaR.
-- HB 2020-06-16: inserted LUT for "unconstraint pt" (MU_UPT_LUT).
-- HB 2020-06-08: changes for new muon structure with "unconstraint pt" and "impact parameter".
-- HB 2019-10-10: moved constants for prescaler to fdl_pkg.vhd
-- HB 2019-10-08: changed some values in LUTs MUON_COS_PHI_LUT and MUON_SIN_PHI_LUT according to LUTs from emulator (given by Len)
-- HB 2019-06-03: inserted PRESCALER_FRACTION_WIDTH for fractional prescaler values
-- HB 2019-05-02: inserted types for calo_cond_matrix.vhd.
-- HB 2018-08-06: inserted constants and types for "Asymmetry" and "Centrality" (included in esums data structure).
-- HB 2017-10-02: inserted constant MAX_WIDTH_DETA_DPHI_LIMIT_VECTOR and MAX_WIDTH_DR_LIMIT_VECTOR.
-- HB 2017-09-29: inserted constant MAX_WIDTH_MASS_LIMIT_VECTOR and MAX_WIDTH_TBPT_LIMIT_VECTOR.
-- HB 2017-09-05: inserted constant MAX_CALO_OBJECTS.
-- HB 2017-05-04: updated for "unsorted" calo-calo constants.
-- HB 2017-04-26: updated mass types definition.
-- HB 2017-04-11: updated muon structure for "raw" ann "extrapolated" phi and eta bits (phi_high, phi_low, eta_high and eta_low => for "extrapolated").
-- HB 2017-03-30: changed ET_PRECISION in strings to PT_PRECISION.
-- HB 2017-03-28: inserted integer type array for cos and sin phi (for twobody_pt).
-- HB 2017-01-20: cleaned up, added new LUTs, made LUTs more compact, adjusted pt LUTs (for mass) to new scale set (2017-01-12) at higest bins.
-- HB 2017-01-18: inserted LUTs for muon cos phi and sin phi.
-- HB 2016-12-13: updated for transverse mass and pt**2 cut.
-- HB 2016-10-11: updated TOWERCOUNT.
-- HB 2016-09-29: changed to a template which is base for generation of gtl_pkg.vhd by script (makeProject.py) during build (similar to "gt_mp7_top_pkg_tpl.vhd").
--                File gtl_constants.vhd is generated by VHDL Producer and inserted at ""gtl_constants.vhd"" during build process.
-- HB 2016-09-16: moved to ../gtl directory, part of the "fix" code now. Constants UGT_xxx definition in ugt_constant_pkg.vhd (in L1Menu directory).
-- HB 2016-06-29: Inserted new esums quantities (ETTEM and ETMHF).
-- HB 2016-04-26: Updated minimum bias Hf types to same notation as in grammar.
-- HB 2015-11-25: Inserted constants and LUTs for correlation conditions.
-- HB 2015-04-28: Inserted records for energy summary objects and calorimeter conditions version 2 (calo_conditions_v2.vhd).
-- HB 2014-09-09: GTL and FDL firmware major, minor and revision versions moved to gt_mp7_core_pkg.vhd (GTL_FW_MAJOR_VERSION, etc.)
--                for creating a tag name by a script independent from L1Menu.
-- HB 2016-09-16: inserted HTMHF to esums

library ieee;
use ieee.std_logic_1164.all;

use work.lhc_data_pkg.all;
use work.math_pkg.all;
use work.gt_mp7_core_pkg.all;

use work.mp7_data_types.all;

package gtl_pkg is

-- Definition of input lanes
-- NR_LANES = NR_REGIONS * 4 => 72
-- HB 2023-09-07: NR_INPUT_LANES not used anymore
--constant NR_INPUT_LANES : natural := 24; -- max. input links from optical patch panel
constant LINK_FRAMES : natural := 6;
type lword_array is array (0 to LINK_FRAMES-1) of lword;

-- Fixed pipeline structure
constant BX_PIPELINE_STAGES: natural := 5; -- +/- 2bx pipeline
constant ESUMS_COND_STAGES: natural := 2; -- pipeline stages for "External conditions" to get same pipeline to algos as conditions
constant MB_COND_STAGES: natural := 2; -- pipeline stages for "Minimum Bias conditions" to get same pipeline to algos as conditions
constant TC_COND_STAGES: natural := 2; -- pipeline stages for "Towercount condition" to get same pipeline to algos as conditions
constant EXT_COND_STAGES: natural := 2; -- pipeline stages for "External conditions" to get same pipeline to algos as conditions
constant CENTRALITY_STAGES: natural := 2; -- pipeline stages for "Centrality" to get same pipeline to algos as conditions
constant MUS_STAGES: natural := 2; -- pipeline stages for "Hadronic shower triggers (muon)" to get same pipeline to algos as conditions
constant ADT_SIM_DEL: natural := 2; -- delay of ADT for simulation 
constant ZDC_STAGES: natural := 2; -- pipeline stages for "ZDC condition" to get same pipeline to algos as conditions
constant INTERMEDIATE_PIPELINE: boolean := true; -- intermediate pipeline
constant CONDITIONS_PIPELINE: boolean := true; -- pipeline at output of conditions

-- Selector for options
constant SPYMEM: boolean := true; -- selector for input spymem

-- Definition of general types
type std_logic_array is array (natural range <>) of std_logic;
type std_logic_2dim_array is array (natural range <>, natural range <>) of std_logic;
type std_logic_3dim_array is array (natural range <>, natural range <>, natural range <>) of std_logic;
type std_logic_4dim_array is array (natural range <>, natural range <>, natural range <>, natural range <>) of std_logic;

type integer_array is array (natural range <>) of integer;
type integer_2dim_array is array (natural range <>, natural range <>) of integer;

-- Definition of object types
constant NR_CALO_TYPES : natural := 3;
constant EG_TYPE : natural range 0 to NR_CALO_TYPES-1 := 0;
constant JET_TYPE : natural range 0 to NR_CALO_TYPES-1 := 1;
constant TAU_TYPE : natural range 0 to NR_CALO_TYPES-1 := 2;
constant NR_ESUMS_TYPES : natural := 11;
constant ETT_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+0;
constant HTT_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+1;
constant ETM_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+2;
constant HTM_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+3;
constant ETTEM_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+4;
constant ETMHF_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+5;
constant HTMHF_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+6;
constant ASYMET_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+7;
constant ASYMHT_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+8;
constant ASYMETHF_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+9;
constant ASYMHTHF_TYPE : natural range NR_CALO_TYPES to NR_CALO_TYPES+NR_ESUMS_TYPES-1 := NR_CALO_TYPES+10;
constant MU_TYPE : natural := NR_CALO_TYPES+NR_ESUMS_TYPES+0;

-- ==== MUONs - begin ============================================================
-- MUONs
constant NR_MUON_TEMPLATES : positive range 1 to 4 := 4; -- number of max. templates for muon conditions
constant NR_MUON_OBJECTS : positive := MUON_ARRAY_LENGTH; -- from lhc_data_pkg.vhd
constant NR_MU_OBJECTS : positive := NR_MUON_OBJECTS;
constant MAX_MUON_BITS : positive := MUON_DATA_WIDTH; -- from lhc_data_pkg.vhd
constant MAX_MUON_TEMPLATES_BITS : positive range 1 to MUON_DATA_WIDTH := 16;

-- MUON objects bits
constant MUON_PHI_LOW : natural := 0;
constant MUON_PHI_HIGH : natural := 9;
constant MUON_PHI_BITS : natural := MUON_PHI_HIGH-MUON_PHI_LOW+1;
constant MUON_PT_LOW : natural := 10;
constant MUON_PT_HIGH : natural := 18;
constant MUON_PT_BITS : natural := MUON_PT_HIGH-MUON_PT_LOW+1;
constant MUON_QUAL_LOW : natural := 19;
constant MUON_QUAL_HIGH : natural := 22;
constant MUON_QUAL_BITS : natural := MUON_QUAL_HIGH-MUON_QUAL_LOW+1;
constant MUON_ETA_LOW : natural := 23;
constant MUON_ETA_HIGH : natural := 31;
constant MUON_ETA_BITS : natural := MUON_ETA_HIGH-MUON_ETA_LOW+1;
constant MUON_ISO_LOW : natural := 32;
constant MUON_ISO_HIGH : natural := 33;
constant MUON_ISO_BITS : natural := MUON_ISO_HIGH-MUON_ISO_LOW+1;
constant MUON_CHARGE_LOW : natural := 34;
constant MUON_CHARGE_HIGH : natural := 35;
constant MUON_CHARGE_BITS : natural := MUON_CHARGE_HIGH-MUON_CHARGE_LOW+1;
constant MUON_IDX_BITS_LOW : natural := 36;
constant MUON_IDX_BITS_HIGH : natural := 42;
constant MUON_IDX_BITS : natural := MUON_IDX_BITS_HIGH-MUON_IDX_BITS_LOW+1;
constant MUON_PHI_RAW_LOW : natural := 43;
constant MUON_PHI_RAW_HIGH : natural := 52;
constant MUON_PHI_RAW_BITS : natural := MUON_PHI_RAW_HIGH-MUON_PHI_RAW_LOW+1;
constant MUON_UPT_LOW : natural := 53;
constant MUON_UPT_HIGH : natural := 60;
constant MUON_UPT_BITS : natural := MUON_UPT_HIGH-MUON_UPT_LOW+1;
constant MUON_IP_LOW : natural := 62;
constant MUON_IP_HIGH : natural := 63;
constant MUON_IP_BITS : natural := MUON_IP_HIGH-MUON_IP_LOW+1;

-- Hadronic shower trigger bits (muon shower [mus]) - preliminary definition
-- MUS0 => muon obj 0, bit 61
-- MUS1 => muon obj 2, bit 61
-- MUSOOT0 => muon obj 4, bit 61
-- MUSOOT1 => muon obj 6, bit 61
constant MUS_BIT : natural := 61;
constant NR_MUS_BITS: natural := 5;
constant MUON_OBJ_MUS0 : natural := 0;
constant MUON_OBJ_MUS1 : natural := 2;
constant MUON_OBJ_MUSOOT0 : natural := 4;
constant MUON_OBJ_MUSOOT1 : natural := 6;
-- HB 2023-03-06: added hadronic shower trigger bit MUS2 
-- MUS2 bit
-- MUS2 => muon obj 3, bit 61
constant MUON_OBJ_MUS2 : natural := 3;
type mus_bit_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic;

type muon_objects_array is array (natural range <>) of std_logic_vector(MAX_MUON_BITS-1 downto 0);
type bx_muon_objects_array is array (0 to BX_PIPELINE_STAGES-1) of muon_objects_array(0 to NR_MU_OBJECTS-1);
type muon_templates_array is array (1 to NR_MUON_TEMPLATES) of std_logic_vector(MAX_MUON_TEMPLATES_BITS-1 downto 0);
type muon_templates_quality_array is array (1 to NR_MUON_TEMPLATES) of std_logic_vector((2**(MUON_QUAL_HIGH-MUON_QUAL_LOW+1))-1 downto 0);
type muon_templates_iso_array is array (1 to NR_MUON_TEMPLATES) of std_logic_vector((2**(MUON_ISO_HIGH-MUON_ISO_LOW+1))-1 downto 0);
type muon_templates_ip_array is array (1 to NR_MUON_TEMPLATES) of std_logic_vector((2**(MUON_IP_HIGH-MUON_IP_LOW+1))-1 downto 0);
type muon_templates_string_array is array (1 to NR_MUON_TEMPLATES) of string(1 to 3);

-- ==== MUONs - end ============================================================

-- ==== CALOs - begin ============================================================
-- CALOs
constant NR_CALO_TEMPLATES : positive range 1 to 4 := 4; -- number of max. templates for calorimeter conditions
constant NR_EG_OBJECTS : positive := EG_ARRAY_LENGTH; -- number eg objects, from lhc_data_pkg.vhd
constant NR_JET_OBJECTS : positive := JET_ARRAY_LENGTH; -- number jet objects, from lhc_data_pkg.vhd
constant NR_TAU_OBJECTS : positive := TAU_ARRAY_LENGTH; -- number tau objects, from lhc_data_pkg.vhd
constant MAX_CALO_OBJECTS : positive := max(EG_ARRAY_LENGTH, JET_ARRAY_LENGTH, TAU_ARRAY_LENGTH);
constant MAX_CALO_BITS : positive := max(EG_DATA_WIDTH, JET_DATA_WIDTH, TAU_DATA_WIDTH);

constant EG_ET_LOW : natural := 0;
constant EG_ET_HIGH : natural := 8;
constant EG_ET_BITS : natural := EG_ET_HIGH-EG_ET_LOW+1;
constant EG_ETA_LOW : natural := 9;
constant EG_ETA_HIGH : natural := 16;
constant EG_ETA_BITS : natural := EG_ETA_HIGH-EG_ETA_LOW+1;
constant EG_PHI_LOW : natural := 17;
constant EG_PHI_HIGH : natural := 24;
constant EG_PHI_BITS : natural := EG_PHI_HIGH-EG_PHI_LOW+1;
constant EG_ISO_LOW : natural := 25;
constant EG_ISO_HIGH : natural := 26;
constant EG_ISO_BITS : natural := EG_ISO_HIGH-EG_ISO_LOW+1;

constant JET_ET_LOW : natural := 0;
constant JET_ET_HIGH : natural := 10;
constant JET_ET_BITS : natural := JET_ET_HIGH-JET_ET_LOW+1;
constant JET_ETA_LOW : natural := 11;
constant JET_ETA_HIGH : natural := 18;
constant JET_ETA_BITS : natural := JET_ETA_HIGH-JET_ETA_LOW+1;
constant JET_PHI_LOW : natural := 19;
constant JET_PHI_HIGH : natural := 26;
constant JET_PHI_BITS : natural := JET_PHI_HIGH-JET_PHI_LOW+1;
constant JET_DISP_BIT : natural := 27;

constant TAU_ET_LOW : natural := 0;
constant TAU_ET_HIGH : natural := 8;
constant TAU_ET_BITS : natural := TAU_ET_HIGH-TAU_ET_LOW+1;
constant TAU_ETA_LOW : natural := 9;
constant TAU_ETA_HIGH : natural := 16;
constant TAU_ETA_BITS : natural := TAU_ETA_HIGH-TAU_ETA_LOW+1;
constant TAU_PHI_LOW : natural := 17;
constant TAU_PHI_HIGH : natural := 24;
constant TAU_PHI_BITS : natural := TAU_PHI_HIGH-TAU_PHI_LOW+1;
constant TAU_ISO_LOW : natural := 25;
constant TAU_ISO_HIGH : natural := 26;
constant TAU_ISO_BITS : natural := TAU_ISO_HIGH-TAU_ISO_LOW+1;

type calo_objects_array is array (natural range <>) of std_logic_vector(MAX_CALO_BITS-1 downto 0);
type bx_eg_objects_array is array (0 to BX_PIPELINE_STAGES-1) of calo_objects_array(0 to NR_EG_OBJECTS-1);
type bx_jet_objects_array is array (0 to BX_PIPELINE_STAGES-1) of calo_objects_array(0 to NR_JET_OBJECTS-1);
type bx_tau_objects_array is array (0 to BX_PIPELINE_STAGES-1) of calo_objects_array(0 to NR_TAU_OBJECTS-1);
constant MAX_CALO_TEMPLATES_BITS : positive range 1 to MAX_CALO_BITS := 16;
type calo_templates_array is array (1 to NR_CALO_TEMPLATES) of std_logic_vector(MAX_CALO_TEMPLATES_BITS-1 downto 0);
constant MAX_CALO_ET_BITS : positive := max(EG_ET_BITS, JET_ET_BITS, TAU_ET_BITS);
constant MAX_CALO_ETA_BITS : positive := max(EG_ETA_BITS, JET_ETA_BITS, TAU_ETA_BITS);
constant MAX_CALO_PHI_BITS : positive := max(EG_PHI_BITS, JET_PHI_BITS, TAU_PHI_BITS);
constant MAX_CALO_ISO_BITS : positive := max(EG_ISO_BITS, TAU_ISO_BITS);
type calo_templates_iso_array is array (1 to NR_CALO_TEMPLATES) of std_logic_vector(2**MAX_CALO_ISO_BITS-1 downto 0);

-- *******************************************************************************************************
-- ESUMs
-- HB 2016-10-11: changed MAX_ESUMS_BITS to actual value
constant MAX_ESUMS_BITS : positive := 20; -- see ETM, HTM, etc.
constant MAX_ESUMS_TEMPLATES_BITS : positive range 1 to MAX_ESUMS_BITS := 16;

constant NR_ETT_OBJECTS : positive := 1;
constant NR_HTT_OBJECTS : positive := 1;
constant NR_ETM_OBJECTS : positive := 1;
constant NR_HTM_OBJECTS : positive := 1;
constant NR_ETMHF_OBJECTS : positive := 1;
constant NR_HTMHF_OBJECTS : positive := 1;

constant ETT_ET_LOW : natural := 0;
constant ETT_ET_HIGH : natural := 11;
constant ETT_ET_BITS : natural := ETT_ET_HIGH-ETT_ET_LOW+1;

constant HTT_ET_LOW : natural := 0;
constant HTT_ET_HIGH : natural := 11;
constant HTT_ET_BITS : natural := HTT_ET_HIGH-HTT_ET_LOW+1;

constant ETM_ET_LOW : natural := 0;
constant ETM_ET_HIGH : natural := 11;
constant ETM_ET_BITS : natural := ETM_ET_HIGH-ETM_ET_LOW+1;
constant ETM_PHI_LOW : natural := 12;
constant ETM_PHI_HIGH : natural := 19;
constant ETM_PHI_BITS : natural := ETM_PHI_HIGH-ETM_PHI_LOW+1;

constant HTM_ET_LOW : natural := 0;
constant HTM_ET_HIGH : natural := 11;
constant HTM_ET_BITS : natural := HTM_ET_HIGH-HTM_ET_LOW+1;
constant HTM_PHI_LOW : natural := 12;
constant HTM_PHI_HIGH : natural := 19;
constant HTM_PHI_BITS : natural := HTM_PHI_HIGH-HTM_PHI_LOW+1;

constant ETTEM_IN_ETT_LOW : natural := 12;
constant ETTEM_IN_ETT_HIGH : natural := 23;
constant ETTEM_ET_LOW : natural := 0;
constant ETTEM_ET_HIGH : natural := 11;
constant ETTEM_ET_BITS : natural := ETTEM_ET_HIGH-ETTEM_ET_LOW+1;

constant ETMHF_ET_LOW : natural := 0;
constant ETMHF_ET_HIGH : natural := 11;
constant ETMHF_ET_BITS : natural := ETMHF_ET_HIGH-ETMHF_ET_LOW+1;
constant ETMHF_PHI_LOW : natural := 12;
constant ETMHF_PHI_HIGH : natural := 19;
constant ETMHF_PHI_BITS : natural := ETMHF_PHI_HIGH-ETMHF_PHI_LOW+1;

constant HTMHF_ET_LOW : natural := 0;
constant HTMHF_ET_HIGH : natural := 11;
constant HTMHF_ET_BITS : natural := HTMHF_ET_HIGH-HTMHF_ET_LOW+1;
constant HTMHF_PHI_LOW : natural := 12;
constant HTMHF_PHI_HIGH : natural := 19;
constant HTMHF_PHI_BITS : natural := HTMHF_PHI_HIGH-HTMHF_PHI_LOW+1;

constant MAX_ESUMS_ET_BITS_1 : positive := max(ETT_ET_BITS, HTT_ET_BITS, ETM_ET_BITS);
constant MAX_ESUMS_ET_BITS_2 : positive := max(MAX_ESUMS_ET_BITS_1, HTM_ET_BITS, ETTEM_ET_BITS);
constant MAX_ESUMS_ET_BITS : positive := max(MAX_ESUMS_ET_BITS_2, ETMHF_ET_BITS, HTMHF_ET_BITS);
constant MAX_ESUMS_PHI_BITS_1 : positive := max(ETM_PHI_BITS, HTM_PHI_BITS, ETMHF_PHI_BITS);
constant MAX_ESUMS_PHI_BITS : positive := max(MAX_ESUMS_PHI_BITS_1, HTMHF_PHI_BITS);

constant ASYMET_IN_ETM_HIGH : natural := 27;
constant ASYMET_IN_ETM_LOW : natural := 20;
constant ASYMHT_IN_HTM_HIGH : natural := 27;
constant ASYMHT_IN_HTM_LOW : natural := 20;
constant ASYMETHF_IN_ETMHF_HIGH : natural := 27;
constant ASYMETHF_IN_ETMHF_LOW : natural := 20;
constant ASYMHTHF_IN_HTMHF_HIGH : natural := 27;
constant ASYMHTHF_IN_HTMHF_LOW : natural := 20;

constant MAX_ASYM_BITS : positive range 1 to 8 := 8;
constant MAX_ASYM_TEMPLATES_BITS : positive range 1 to MAX_ASYM_BITS := 8;

constant ASYMET_LOW : natural := 0;
constant ASYMET_HIGH : natural := 7;

constant ASYMHT_LOW : natural := 0;
constant ASYMHT_HIGH : natural := 7;

constant ASYMETHF_LOW : natural := 0;
constant ASYMETHF_HIGH : natural := 7;

constant ASYMHTHF_LOW : natural := 0;
constant ASYMHTHF_HIGH : natural := 7;

type bx_esums_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
-- *******************************************************************************************************
-- Type definitions for "Centrality"
constant CENT_IN_ETMHF_HIGH : natural := 31;
constant CENT_IN_ETMHF_LOW : natural := 28;
constant CENT_IN_HTMHF_HIGH : natural := 31;
constant CENT_IN_HTMHF_LOW : natural := 28;

constant CENT_LBITS_LOW : natural := 0;
constant CENT_LBITS_HIGH: natural := 3;
constant CENT_UBITS_LOW : natural := 4;
constant CENT_UBITS_HIGH: natural := 7;

constant NR_CENTRALITY_BITS : positive := CENT_UBITS_HIGH-CENT_LBITS_LOW+1;
type bx_cent_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic;

-- *******************************************************************************************************
-- HB 2016-09-16: inserted TOWERCOUNT
constant NR_TOWERCOUNT_OBJECTS : positive := 1;
constant TOWERCOUNT_IN_HTT_LOW : natural := 12;
constant TOWERCOUNT_IN_HTT_HIGH : natural := 24;
constant TOWERCOUNT_COUNT_LOW : natural := 0;
constant TOWERCOUNT_COUNT_HIGH : natural := 12;
constant MAX_TOWERCOUNT_BITS : natural := 16; -- 4 hex digits !
type bx_towercount_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic_vector(MAX_TOWERCOUNT_BITS-1 downto 0);

-- *******************************************************************************************************
-- HB 2016-04-18: updates for "min bias trigger" objects (quantities) for Low-pileup-run May 2016
-- HB 2016-04-21: see email from Johannes (Andrew Rose), 2016-04-20 15:34

constant MBT0HFP_IN_ETT_HIGH : natural := 31;
constant MBT0HFP_IN_ETT_LOW : natural := 28;
constant MBT0HFM_IN_HTT_HIGH : natural := 31;
constant MBT0HFM_IN_HTT_LOW : natural := 28;
constant MBT1HFP_IN_ETM_HIGH : natural := 31;
constant MBT1HFP_IN_ETM_LOW : natural := 28;
constant MBT1HFM_IN_HTM_HIGH : natural := 31;
constant MBT1HFM_IN_HTM_LOW : natural := 28;

constant MBT0HFP_TYPE : natural range 0 to 3 := 0;
constant MBT0HFM_TYPE : natural range 0 to 3 := 1;
constant MBT1HFP_TYPE : natural range 0 to 3 := 2;
constant MBT1HFM_TYPE : natural range 0 to 3 := 3;

constant MAX_MBHF_BITS : positive range 1 to 4 := 4;
constant MAX_MBHF_TEMPLATES_BITS : positive range 1 to MAX_MBHF_BITS := 4;

constant MBT0HFP_COUNT_LOW : natural := 0;
constant MBT0HFP_COUNT_HIGH : natural := 3;

constant MBT0HFM_COUNT_LOW : natural := 0;
constant MBT0HFM_COUNT_HIGH : natural := 3;

constant MBT1HFP_COUNT_LOW : natural := 0;
constant MBT1HFP_COUNT_HIGH : natural := 3;

constant MBT1HFM_COUNT_LOW : natural := 0;
constant MBT1HFM_COUNT_HIGH : natural := 3;

-- *******************************************************************************************************
-- HB 2022-10-10: inserted ZDC
constant NR_ZDC_OBJECTS : positive := 6;

-- Email Jeremy Mans 24.7.2023:
-- Definition of ZDC data (lower 16 bits on 5G link frames):

-- [8 bits of zero] [3c or 7c]
-- [6 bits of zero] [10 bit energy from ZDC-]
-- [6 bits of zero] [10 bit energy from ZDC+]
-- [16 bits of zero]
-- [4 bits of zero] [12 bits of counter]
-- [16 bits of zero]

constant EN_MINUS_FRAME : natural := 1; -- EN_MINUS (ZDC-) on frame 1 of ZDC link
constant EN_MINUS_BIT_LOW : natural := 0;
constant EN_MINUS_BIT_HIGH : natural := 9;
constant EN_PLUS_FRAME : natural := 2; -- EN_PLUS (ZDC+) on frame 2 of ZDC link
constant EN_PLUS_BIT_LOW : natural := 0;
constant EN_PLUS_BIT_HIGH : natural := 9;
constant ZDC_BIT_LOW : natural := 0;
constant ZDC_BIT_HIGH : natural := 9;
constant MAX_ZDC_BITS : natural := 16;
constant ZDC_THR_BITS : natural := 16;
-- type zdc_5g_array is array (0 to LINK_FRAMES-1) of std_logic_vector(SW_DATA_WIDTH-1 downto 0);
type zdc_array is array (0 to NR_ZDC_OBJECTS-1) of std_logic_vector(SW_DATA_WIDTH-1 downto 0);
type bx_zdc_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic_vector(ZDC_BIT_HIGH-ZDC_BIT_LOW downto 0);

-- *******************************************************************************************************
-- max bits for comparators.vhd
constant MAX_PT_BITS_1 : positive := max(MUON_PT_BITS, MAX_CALO_ET_BITS, MAX_ESUMS_ET_BITS);
constant MAX_PT_BITS : positive := max(MAX_PT_BITS_1, MAX_ASYM_BITS);
constant MAX_ETA_BITS : positive := max(MUON_ETA_BITS, MAX_CALO_ETA_BITS);
constant MAX_PHI_BITS : positive := max(MUON_PHI_BITS, MAX_CALO_PHI_BITS, MAX_ESUMS_PHI_BITS);
constant MAX_ISO_BITS : positive := max(MUON_ISO_BITS, MAX_CALO_ISO_BITS);

constant COMMON_NR_TEMPLATES : positive range 1 to 4 := 4; -- number of max. templates
constant MAX_TEMPLATES_BITS : positive := max(MAX_CALO_TEMPLATES_BITS, MAX_MUON_TEMPLATES_BITS);
type common_templates_array is array (1 to COMMON_NR_TEMPLATES) of std_logic_vector(MAX_TEMPLATES_BITS-1 downto 0);
type common_templates_iso_array is array (1 to COMMON_NR_TEMPLATES) of std_logic_vector(2**MAX_ISO_BITS-1 downto 0);
type common_templates_quality_array is array (1 to COMMON_NR_TEMPLATES) of std_logic_vector(2**MUON_QUAL_BITS-1 downto 0);
type common_templates_ip_array is array (1 to COMMON_NR_TEMPLATES) of std_logic_vector(2**MUON_IP_BITS-1 downto 0);
type common_templates_boolean_array is array (1 to COMMON_NR_TEMPLATES) of boolean;
type common_templates_natural_array is array (1 to COMMON_NR_TEMPLATES) of natural;
type common_templates_string_array is array (1 to COMMON_NR_TEMPLATES) of string(1 to 3);
constant MAX_OBJECT_BITS : positive := max(MAX_CALO_BITS, MAX_MUON_BITS);
type common_objects_array is array (natural range <>) of std_logic_vector(MAX_OBJECT_BITS-1 downto 0);

-- ==== CALOs - end ============================================================

-- "External conditions" (former "Technical Triggers" and "External Algorithms") definitions
-- number of "External conditions" inputs (proposed max. NR_EXTERNAL_CONDITIONS = 256), from lhc_data_pkg.vhd
constant NR_EXTERNAL_CONDITIONS : positive := EXTERNAL_CONDITIONS_DATA_WIDTH;
type bx_ext_cond_array is array (0 to BX_PIPELINE_STAGES-1) of std_logic_vector(NR_EXTERNAL_CONDITIONS-1 downto 0);

-- data records
type gtl_data_record is record
    mu : muon_objects_array(0 to NR_MUON_OBJECTS-1);
    eg : calo_objects_array(0 to NR_EG_OBJECTS-1);
    jet : calo_objects_array(0 to NR_JET_OBJECTS-1);
    tau : calo_objects_array(0 to NR_TAU_OBJECTS-1);
    ett : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    htt : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    etm : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    htm : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    ettem : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    etmhf : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    htmhf : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    mbt1hfp, mbt1hfm, mbt0hfp, mbt0hfm : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    asymet, asymht, asymethf, asymhthf : std_logic_vector(MAX_ESUMS_BITS-1 downto 0);
    towercount : std_logic_vector(MAX_TOWERCOUNT_BITS-1 downto 0);
    centrality : std_logic_vector(NR_CENTRALITY_BITS-1 downto 0);
    ext_cond : std_logic_vector(EXTERNAL_CONDITIONS_DATA_WIDTH-1 downto 0);
    zdc : zdc_array;
end record gtl_data_record;

type bx_data_record is record
    mu : bx_muon_objects_array;
    eg : bx_eg_objects_array;
    jet : bx_jet_objects_array;
    tau : bx_tau_objects_array;
    ett : bx_esums_array;
    htt : bx_esums_array;
    etm : bx_esums_array;
    htm : bx_esums_array;
    ettem : bx_esums_array;
    etmhf : bx_esums_array;
    htmhf : bx_esums_array;
    mbt1hfp : bx_esums_array;
    mbt1hfm : bx_esums_array;
    mbt0hfp : bx_esums_array;
    mbt0hfm : bx_esums_array;
    asymet : bx_esums_array;
    asymht : bx_esums_array;
    asymethf : bx_esums_array;
    asymhthf : bx_esums_array;
    towercount : bx_towercount_array;
    cent0 : bx_cent_array;
    cent1 : bx_cent_array;
    cent2 : bx_cent_array;
    cent3 : bx_cent_array;
    cent4 : bx_cent_array;
    cent5 : bx_cent_array;
    cent6 : bx_cent_array;
    cent7 : bx_cent_array;
    ext_cond : bx_ext_cond_array;
    mus0, mus1, mus2, musoot0, musoot1 : mus_bit_array;
    zdcm : bx_zdc_array;
    zdcp : bx_zdc_array;
end record bx_data_record;

-- ==== Correlations - begin ============================================================
-- ********************************************************
-- deta, dphi and dr parameters

-- constant PI : real :=  3.14159;
constant PI : real :=  3.15; -- Takashi M. used this value for PI
constant MUON_ETA_STEP : real := 0.087/8.0; -- values from scales
constant CALO_PHI_BINS : positive := 144; -- values from scales
constant MUON_PHI_BINS : positive := 576; -- values from scales
constant CALO_PHI_HALF_RANGE_BINS : positive := CALO_PHI_BINS/2;
constant MUON_PHI_HALF_RANGE_BINS : positive := MUON_PHI_BINS/2;
constant MU_PHI_HALF_RANGE_BINS : positive := MUON_PHI_HALF_RANGE_BINS;
constant MUON_PHI_HALF_RES_HALF_RANGE_BINS : positive := MUON_PHI_HALF_RANGE_BINS/2;
constant PHI_MIN : real := 0.0; -- phi min.: 0.0
constant PHI_MAX : real := 2.0*PI; -- phi max.: 2*PI
constant ETA_MIN : real := -5.0; -- eta min.: -5.0
constant ETA_MAX : real := 5.0; -- eta max.: +5.0
constant ETA_RANGE_REAL : real := 10.0; -- eta range max.: -5.0 to +5.0
constant DETA_DPHI_PRECISION_ALL: positive := 3;
constant DETA_DPHI_VECTOR_WIDTH_ALL: positive := log2c(max(integer(ETA_RANGE_REAL*(real(10**DETA_DPHI_PRECISION_ALL))),integer(PHI_MAX*(real(10**DETA_DPHI_PRECISION_ALL)))));
constant MAX_DIFF_BITS : positive := 16;
constant MAX_WIDTH_DETA_DPHI_LIMIT_VECTOR : positive := 32;
constant MAX_WIDTH_DR_LIMIT_VECTOR : positive := 64;

type diff_inputs_array is array (natural range <>) of std_logic_vector(MAX_DIFF_BITS-1 downto 0);
type deta_dphi_vector_array is array (natural range <>, natural range <>) of std_logic_vector(DETA_DPHI_VECTOR_WIDTH_ALL-1 downto 0);
type dr_dim2_array is array (natural range <>, natural range <>) of std_logic_vector(MAX_WIDTH_DR_LIMIT_VECTOR-1 downto 0);

-- ********************************************************
-- mass parameters

constant MASS_TYPE_MAX_VALUE : natural := 3;
constant INVARIANT_MASS_TYPE : natural range 0 to MASS_TYPE_MAX_VALUE := 0;
constant TRANSVERSE_MASS_TYPE : natural range 0 to MASS_TYPE_MAX_VALUE := 1;
constant INVARIANT_MASS_UPT_TYPE : natural range 0 to MASS_TYPE_MAX_VALUE := 2;
constant INVARIANT_MASS_DIV_DR_TYPE : natural range 0 to MASS_TYPE_MAX_VALUE := 3;

-- calo-calo-correlation
constant CALO_PT_PRECISION : positive := 1;
constant EG_PT_VECTOR_WIDTH: positive := log2c((2**(EG_ET_HIGH-EG_ET_LOW+1)-1)*(10**CALO_PT_PRECISION)); -- max. value 255.5 GeV => 2555 => 0x9FB
constant JET_PT_VECTOR_WIDTH: positive := log2c((2**(JET_ET_HIGH-JET_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));
constant TAU_PT_VECTOR_WIDTH: positive := log2c((2**(TAU_ET_HIGH-TAU_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));
constant ETM_PT_VECTOR_WIDTH: positive := log2c((2**(ETM_ET_HIGH-ETM_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));
constant ETMHF_PT_VECTOR_WIDTH: positive := log2c((2**(ETMHF_ET_HIGH-ETMHF_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));
constant HTM_PT_VECTOR_WIDTH: positive := log2c((2**(HTM_ET_HIGH-HTM_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));
constant HTMHF_PT_VECTOR_WIDTH: positive := log2c((2**(HTMHF_ET_HIGH-HTMHF_ET_LOW+1)-1)*(10**CALO_PT_PRECISION));

constant CALO_CALO_COSH_COS_PRECISION : positive := 3;
constant CALO_CALO_COSH_COS_VECTOR_WIDTH: positive := log2c(10597282-(-1000));
type calo_cosh_cos_vector_array is array (natural range <>, natural range <>) of std_logic_vector(CALO_CALO_COSH_COS_VECTOR_WIDTH-1 downto 0);

-- muon-muon-correlation
constant MUON_PT_PRECISION : positive := 1; -- 1 digit after decimal point
constant MUON_MUON_COSH_COS_PRECISION : positive := 4; -- 4 digits after decimal point (after roundimg to the 5th digit)

constant MUON_PT_VECTOR_WIDTH: positive := log2c((2**(MUON_PT_HIGH-MUON_PT_LOW+1)-1)*(10**MUON_PT_PRECISION)); -- max. value 255.5 GeV => 2555 => 0x9FB
constant MU_PT_VECTOR_WIDTH: positive := MUON_PT_VECTOR_WIDTH;

constant MUON_UPT_PRECISION : positive := 1; -- 1 digit after decimal point
constant MU_UPT_VECTOR_WIDTH: positive := 12; -- max. value 255.0 GeV => 2550 (255.0 * 10**MUON_UPT_PRECISION) => 0x9F6

constant MUON_MUON_COSH_COS_VECTOR_WIDTH: positive := log2c(677303); -- max. value cosh_deta-cos_dphi => [667303-(-10000)]=677303 => 0xA55B7 - highest value in LUT
constant MU_MU_COSH_COS_VECTOR_WIDTH: positive := MUON_MUON_COSH_COS_VECTOR_WIDTH; -- max. value cosh_deta-cos_dphi => [667303-(-10000)]=677303 => 0xA55B7 - highest value in LUT
type muon_cosh_cos_vector_array is array (natural range <>, natural range <>) of std_logic_vector(MUON_MUON_COSH_COS_VECTOR_WIDTH-1 downto 0);

-- calo-muon-correlation
constant CALO_MUON_COSH_COS_PRECISION : positive := 4;
-- HB 2017-01-19: fix value for CALO_MUON_COSH_COS_VECTOR_WIDTH
constant CALO_MUON_COSH_COS_VECTOR_WIDTH: positive := log2c(109487199-(-10000));
type calo_muon_cosh_cos_vector_array is array (natural range <>, natural range <>) of std_logic_vector(CALO_MUON_COSH_COS_VECTOR_WIDTH-1 downto 0);

constant COMMON_COSH_COS_VECTOR_WIDTH: positive := max(CALO_CALO_COSH_COS_VECTOR_WIDTH, MUON_MUON_COSH_COS_VECTOR_WIDTH, CALO_MUON_COSH_COS_VECTOR_WIDTH);
type common_cosh_cos_vector_array is array (natural range <>, natural range <>) of std_logic_vector(COMMON_COSH_COS_VECTOR_WIDTH-1 downto 0);

subtype max_eta_range_integer is integer range 0 to integer(ETA_RANGE_REAL/MUON_ETA_STEP)-1; -- 10.0/0.010875 = 919.54 => rounded(919.54) = 920 - number of bins with muon bin width for full (calo) eta range
type dim2_max_eta_range_array is array (natural range <>, natural range <>) of max_eta_range_integer;
subtype max_phi_range_integer is integer range 0 to max(MUON_PHI_BINS, CALO_PHI_BINS)-1; -- number of bins with muon bin width (=576)
type dim2_max_phi_range_array is array (natural range <>, natural range <>) of max_phi_range_integer;

constant MAX_WIDTH_MASS_LIMIT_VECTOR : positive := 64;
type mass_dim2_array is array (natural range <>, natural range <>) of std_logic_vector(MAX_WIDTH_MASS_LIMIT_VECTOR-1 downto 0);

-- definitions for invariant mass divided by deltaR
type addr_rom_lut_calo_inv_dr_sq_array is array (natural range <>, natural range <>) of std_logic_vector(15 downto 0);

constant CALO_DETA_BINS : positive := 230;
constant CALO_DPHI_BINS : positive := CALO_PHI_BINS; -- 144

constant CALO_DETA_BINS_WIDTH : positive := 8; -- => int(log2(CALO_DETA_BINS))+1
constant CALO_DPHI_BINS_WIDTH : positive := 8; -- => int(log2(CALO_DPHI_BINS))+1
constant CALO_DETA_BINS_WIDTH_ROM : positive := CALO_DETA_BINS_WIDTH;
constant CALO_DPHI_BINS_WIDTH_ROM : positive := CALO_DPHI_BINS_WIDTH;

constant CALO_INV_DR_SQ_LUT_MAX_VAL : natural := 52847140;
constant CALO_CALO_INV_DR_SQ_VECTOR_WIDTH : natural := 26; -- => log2(CALO_INV_DR_SQ_LUT_MAX_VAL)
type calo_inv_dr_sq_vector_array is array (natural range <>, natural range <>) of std_logic_vector(CALO_CALO_INV_DR_SQ_VECTOR_WIDTH-1 downto 0);

constant CALO_CALO_MASS_DIV_DR_VECTOR_WIDTH : positive := 2*JET_PT_VECTOR_WIDTH+CALO_CALO_COSH_COS_VECTOR_WIDTH+CALO_CALO_INV_DR_SQ_VECTOR_WIDTH;
type calo_calo_mass_div_dr_vector_array is array (natural range <>, natural range <>) of std_logic_vector(CALO_CALO_MASS_DIV_DR_VECTOR_WIDTH-1 downto 0);

constant MUON_DETA_BINS : positive := 451;
constant MUON_DPHI_BINS : positive := MUON_PHI_BINS; -- 576

constant MU_DETA_BINS_WIDTH : positive := 9; -- => int(log2(MUON_DETA_BINS))+1
constant MU_DPHI_BINS_WIDTH : positive := 10; -- => int(log2(MUON_DPHI_BINS))+1

-- full muon bins would exceed BRAM resources, therefore reduced bins for ROMs are used
constant MUON_DETA_BINS_ROM : positive := 225; -- double resolution of calos (half of muon eta bins)
constant MUON_DPHI_BINS_ROM : positive := 144; -- same resolution as calos (quarter of muon phi bins)

constant MU_DETA_BINS_WIDTH_ROM : positive := 8; -- => int(log2(MUON_DETA_BINS_ROM))+1
constant MU_DPHI_BINS_WIDTH_ROM : positive := 8; -- => int(log2(MUON_DPHI_BINS_ROM))+1

constant COMMON_DETA_BINS_WIDTH : positive := max(CALO_DETA_BINS_WIDTH, MU_DETA_BINS_WIDTH);
constant COMMON_DPHI_BINS_WIDTH : positive := max(CALO_DPHI_BINS_WIDTH, MU_DPHI_BINS_WIDTH);

type common_deta_bin_vector_array is array (natural range <>, natural range <>) of std_logic_vector(COMMON_DETA_BINS_WIDTH-1 downto 0);
type common_dphi_bin_vector_array is array (natural range <>, natural range <>) of std_logic_vector(COMMON_DPHI_BINS_WIDTH-1 downto 0);

constant MU_MU_INV_DR_SQ_LUT_MAX_VAL : natural := 211388559;
constant MU_MU_INV_DR_SQ_VECTOR_WIDTH : natural := 28; -- => log2(MU_MU_INV_DR_SQ_LUT_MAX_VAL)
type muon_inv_dr_sq_vector_array is array (natural range <>, natural range <>) of std_logic_vector(MU_MU_INV_DR_SQ_VECTOR_WIDTH-1 downto 0);

constant MAX_INV_DR_SQ_VECTOR_WIDTH : positive := MU_MU_INV_DR_SQ_VECTOR_WIDTH; -- 33, max(CALO_INV_DR_SQ_VECTOR_WIDTH, MU_INV_DR_SQ_VECTOR_WIDTH)

constant MU_MU_MASS_DIV_DR_VECTOR_WIDTH : positive := 2*MU_PT_VECTOR_WIDTH+MU_MU_COSH_COS_VECTOR_WIDTH+MU_MU_INV_DR_SQ_VECTOR_WIDTH;
type mu_mu_mass_div_dr_vector_array is array (natural range <>, natural range <>) of std_logic_vector(MU_MU_MASS_DIV_DR_VECTOR_WIDTH-1 downto 0);

constant MAX_WIDTH_MASS_DIV_DR_LIMIT_VECTOR : positive := 84; -- 2*14+27+28=83, 2*MAX_PT_VECTOR_WIDTH+MAX_COSH_COS_VECTOR_WIDTH+MAX_INV_DR_SQ_VECTOR_WIDTH, width 84 used for hex notation !
type mass_div_dr_vector_array is array (natural range <>, natural range <>) of std_logic_vector(MAX_WIDTH_MASS_DIV_DR_LIMIT_VECTOR-1 downto 0);
type max_inv_dr_sq_vector_array is array (natural range <>, natural range <>) of std_logic_vector(MAX_INV_DR_SQ_VECTOR_WIDTH-1 downto 0);

-- ROM selection
constant CALO_CALO_ROM : natural range 0 to 2 := 0;
constant MU_MU_ROM : natural range 0 to 2 := 1;
constant CALO_MU_ROM : natural range 0 to 2 := 2;

-- ********************************************************
-- two-body pt parameters
constant MAX_WIDTH_TBPT_LIMIT_VECTOR : positive := 64;
type tbpt_dim2_array is array (natural range <>, natural range <>) of std_logic_vector(MAX_WIDTH_TBPT_LIMIT_VECTOR-1 downto 0);

constant CALO_SIN_COS_PRECISION : positive := 3;
constant CALO_SIN_COS_VECTOR_WIDTH: positive := log2c(1000-(-1000));
type calo_sin_cos_vector_array is array (natural range <>) of std_logic_vector(CALO_SIN_COS_VECTOR_WIDTH-1 downto 0);

constant MUON_SIN_COS_PRECISION : positive := 4;
constant MUON_SIN_COS_VECTOR_WIDTH: positive := log2c(10000-(-10000));
type muon_sin_cos_vector_array is array (natural range <>) of std_logic_vector(MUON_SIN_COS_VECTOR_WIDTH-1 downto 0);

end package;
