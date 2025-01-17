-- Description:
-- Package for constant and type definitions of FDL firmware in Global Trigger Upgrade system.

-- Version-history:
-- HB 2021-05-14: inserted "ugt_constants" replacement (from gtl_pkg_tpl.vhd).
-- HB 2019-10-10: removed unused code.
-- HB 2019-10-04: new file name for fractional prescale values in float notation.
-- HB 2019-10-03: Cleaned up code.
-- HB 2019-09-27: Inserted 3 new constants for fractional prescale and calculate others from those.
-- HB 2019-09-26: New constants PRESCALE_FACTOR_WIDTH and PRESCALER_INCR, updated PRESCALE_FACTOR_INIT (removed PRESCALER_COUNTER_WIDTH and PRESCALER_FRACTION_WIDTH).
-- HB 2019-07-03: New package for FDL (moved from gtl_pkg.vhd)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.gt_mp7_core_pkg.all;

package fdl_pkg is

{{ugt_constants}}

-- HB 2014-09-09: GTL and FDL firmware major, minor and revision versions moved to gt_mp7_core_pkg.vhd (GTL_FW_MAJOR_VERSION, etc.)
--                for creating a tag name by a script independent from L1Menu.
-- GTL firmware (fix part) version
constant GTL_FW_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(GTL_FW_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(GTL_FW_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(GTL_FW_REV_VERSION, 8));

-- FDL firmware version
constant FDL_FW_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(FDL_FW_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(FDL_FW_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(FDL_FW_REV_VERSION, 8));

-- HB 2022-02-08: for tests - frame version (readable from register "OFFSET_SVN_REVISION_NUMBER" in fdl_module.vhd)
constant FRAME_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(FRAME_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(FRAME_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(FRAME_REV_VERSION, 8));

-- ==== FDL definitions - begin ============================================================
-- Definitions for prescalers (for FDL !)

-- HB HB 2016-03-02: type definition for "global" index use.
type prescale_factor_global_array is array (MAX_NR_ALGOS-1 downto 0) of std_logic_vector(31 downto 0);
type prescale_factor_array is array (NR_ALGOS-1 downto 0) of std_logic_vector(31 downto 0); -- same width as PCIe data

-- Definitions for rate counters
constant RATE_COUNTER_WIDTH : integer := 32;
-- HB HB 2016-03-02: type definition for "global" index use.
type rate_counter_global_array is array (MAX_NR_ALGOS-1 downto 0) of std_logic_vector(RATE_COUNTER_WIDTH-1 downto 0);
type rate_counter_array is array (NR_ALGOS-1 downto 0) of std_logic_vector(RATE_COUNTER_WIDTH-1 downto 0);

-- HB 2014-02-28: changed vector length of init values for finor- and veto-maks, because of min. 32 bits for register
constant MASKS_INIT : ipb_regs_array(0 to MAX_NR_ALGOS-1) := (others => X"00000001"); --Finor and veto masks registers (bit 0 = finor, bit 1 = veto)
-- ==== FDL definitions - end ============================================================

-- *******************************************************************************************************
-- FDL definitions
-- Definitions for prescalers (for FDL !)

-- HB 2019-09-27: changed for proposal of A. Bocci
-- PRESCALE_FACTOR_MAX_VALUE = 42949672 (=0xFFFFFFA0) with 2 fractional digits [and 429496729 (=0xFFFFFFFA) with 1 fractional digit] for 32 bits width
    constant PRESCALE_FACTOR_FRACTION_DIGITS : integer := 2;
    constant PRESCALE_FACTOR_WIDTH : integer := 32;

    constant PRESCALE_FACTOR_INIT_VALUE : real := 1.00;

    constant PRESCALE_FACTOR_INIT_VALUE_INTEGER : integer := integer(PRESCALE_FACTOR_INIT_VALUE * real(10**PRESCALE_FACTOR_FRACTION_DIGITS));
    constant PRESCALE_FACTOR_INIT_VALUE_VEC : std_logic_vector(31 downto 0) := CONV_STD_LOGIC_VECTOR(PRESCALE_FACTOR_INIT_VALUE_INTEGER, 32);
    constant PRESCALE_FACTOR_INIT : ipb_regs_array(0 to MAX_NR_ALGOS-1) := (others => PRESCALE_FACTOR_INIT_VALUE_VEC);
    constant PRESCALER_INCR : std_logic_vector(31 downto 0) := CONV_STD_LOGIC_VECTOR((10**PRESCALE_FACTOR_FRACTION_DIGITS), 32);

-- *******************************************************************************************************

end package;
