-- Description:
-- Package for definitions of ugt top.

-- Version-history:
-- HB 2016-06-30: removed unused constants and comments

--------------------------------------------------------------------------------
--
-- Notes on using `gtu-pkgpatch-ipbus' for this package:
--  * {{IPBUS_TIMESTAMP}}    32 bit UNIX timestamp placeholder (X"00000000")
--  * {{IPBUS_USERNAME}}     unix username 32 char string placeholder (X"...")
--  * {{IPBUS_HOSTNAME}}     machine hostname 32 char string placeholder (X"...")
--  * {{IPBUS_BUILD_VERSION}}     build firmware version (X"...")
--
--------------------------------------------------------------------------------

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mp7_brd_decl.all;

package gt_mp7_top_pkg is

-- BA 2014-08-06: TIMESTAMP generated by gtu-pkgpatch-ipbus (32 bits), has to be interpreted as 32 bit UNIX timestamp.
constant TOP_TIMESTAMP : std_logic_vector(31 downto 0) := {{IPBUS_TIMESTAMP}};
-- HB 2014-05-23: USERNAME generated by gtu-pkgpatch-ipbus (256 bits = 8 x 32 bits), has to be interpreted as 32 ASCII-characters string (from right to left).
constant TOP_USERNAME : std_logic_vector(32*8-1 downto 0)  := {{IPBUS_USERNAME}};
-- HB 2014-05-23: HOSTNAME generated by gtu-pkgpatch-ipbus (256 bits = 8 x 32 bits), has to be interpreted as 32 ASCII-characters string (from right to left).
constant TOP_HOSTNAME : std_logic_vector(32*8-1 downto 0) := {{IPBUS_HOSTNAME}};
-- JW 2015-05-21: TOP_VERSION generated by gtu-pkgpatch-ipbus (32 bits), is the overall version number for a gt_mp7 build (e.g. 1003 for v1003)
constant TOP_BUILD_VERSION : std_logic_vector(31 downto 0) := {{IPBUS_BUILD_VERSION}};

end;



