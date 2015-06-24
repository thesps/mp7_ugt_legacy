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
-- $HeadURL: svn://heros.hephy.oeaw.ac.at/GlobalTriggerUpgrade/firmware/uGT_fw_integration/trunk/uGT_algos/firmware/hdl/gt_mp7_top_pkg_tpl.vhd $
-- $Date: 2015-05-21 15:33:04 +0200 (Thu, 21 May 2015) $
-- $Author: wittmann $
-- $Revision: 3966 $
--------------------------------------------------------------------------------
--
-- Notes on using `gtu-pkgpatch-ipbus' for this package:
--  * {{IPBUS_TIMESTAMP}}    32 bit UNIX timestamp placeholder (X"00000000")
--  * {{IPBUS_USERNAME}}     unix username 32 char string placeholder (X"...")
--  * {{IPBUS_HOSTNAME}}     machine hostname 32 char string placeholder (X"...")
--
--------------------------------------------------------------------------------

-- HB 2015-01-09: v1.4.1.1: removed mp7_formatter (similar to UGMT from Dinyar), connected gt_mp7_core directly to mp7_datapath_2
-- BR:21-11-2014 TOP_SERIAL_VENDOR is not mor relevant, because in future we will read from hardware over ipmi just MAC address
-- HB 2014-09-08: v1.4.0.0: package for mp7 fw version v1.4.0
-- HB 2014-09-08: v1.0.4.15: bug fixed in UCF (to use 4 quads), user constraint for quad(3) was set
-- HB 2014-09-02: v1.0.4.14: changed to 4 quads (for external-conditions) and added signals to mezz-board (bcres_d_FDL_int - for checking on scope) in gt_mp7_top.vhd

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.top_decl.all;
use work.mp7_brd_decl.all;

package gt_mp7_top_pkg is

-- HB 2014-05-30: moved definition from gt_mp7_core_pkg.vhd, but constants still exits in gt_mp7_core_pkg.vhd (see there!)
constant TOP_TYPE_PROTOCOL: std_logic_vector(3 downto 0) := X"3"; -- IP_BUS_2.0
constant TOP_MODULE_TYPE: std_logic_vector(3 downto 0) := X"2"; -- MP7
-- BA 2014-08-06: TIMESTAMP generated by gtu-pkgpatch-ipbus (32 bits), has to be interpreted as 32 bit UNIX timestamp.
constant TOP_TIMESTAMP : std_logic_vector(31 downto 0) := {{IPBUS_TIMESTAMP}};
-- HB 2014-05-23: USERNAME generated by gtu-pkgpatch-ipbus (256 bits = 8 x 32 bits), has to be interpreted as 32 ASCII-characters string (from right to left).
constant TOP_USERNAME : std_logic_vector(32*8-1 downto 0)  := {{IPBUS_USERNAME}};
-- HB 2014-05-23: HOSTNAME generated by gtu-pkgpatch-ipbus (256 bits = 8 x 32 bits), has to be interpreted as 32 ASCII-characters string (from right to left).
constant TOP_HOSTNAME : std_logic_vector(32*8-1 downto 0) := {{IPBUS_HOSTNAME}};
-- JW 2015-05-21: TOP_VERSION generated by gtu-pkgpatch-ipbus (32 bits), is the overall version number for a gt_mp7 build (e.g. 1003 for v1003)
constant TOP_BUILD_VERSION : std_logic_vector(31 downto 0) := {{IPBUS_BUILD_VERSION}};

constant IMPERIAL_FW_VERSION : std_logic_vector(23 downto 0) := X"010600"; -- mp7 fw version v1.4.1
constant UGT_VARIATIONS : std_logic_vector (5 downto 0):= "000011"; -- GT variation of mp7 fw version v1.4.1
--CARD_TYPE configuration
-- 00 : XE
-- 01 : R1
-- 10 : reserved
-- 11 : reserved
constant CARD_TYPE      : std_logic_vector (1 downto 0) := "00";
constant GT_VARIATION   : std_logic_vector(7 downto 0) := CARD_TYPE & UGT_VARIATIONS;

constant IMPERIAL_FW_ID : std_logic_vector(31 downto 0) := IMPERIAL_FW_VERSION & GT_VARIATION;

--constant LHC_BUNCH_COUNT : natural range 3564 to 3564 := 3564; -- LHC orbit length
-- HB 2014-09-01: added external-conditions data in lmp, so 4 NQUADs needed (= 16 lanes)
-- constant NQUAD : natural range 0 to 18 := 3; -- number of QUADs (GTH quads)
   constant NQUAD : natural range 0 to 18 := N_REGION; -- number of QUADs (GTH quads), this constant is defined in top_decl.vhd
-- HB 2014-11-18: 16 lanes used in gt_mp7_core (REGION 0..3)
   constant NR_LANES_GT : natural := 16;
end;



