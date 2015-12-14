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
-- $HeadURL$
-- $Date$
-- $Author$
-- $Revision$
--------------------------------------------------------------------------------

-- Desription:
-- Comparators for transverse momentum, pseudorapidity, azimuth angle, quality and isolation of muon objects

-- Version history:
-- HB 2015-09-24: renamed to "muon_comparators_v2" for removing "d_s_i" from generic. These constants used directly from gtl.pkg now.
-- HB 2015-05-29: removed "use work.gtl_lib.all;" - using "entity work.xxx" for instances

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; -- for function "CONV_INTEGER"

use work.gtl_pkg.all;

entity muon_comparators_v2 is
	generic	(
        pt_ge_mode : boolean;
        pt_threshold: std_logic_vector;
        eta_full_range : boolean;
        eta_w1_upper_limit : std_logic_vector;
        eta_w1_lower_limit : std_logic_vector;
        eta_w2_ignore : boolean;
        eta_w2_upper_limit : std_logic_vector;
        eta_w2_lower_limit : std_logic_vector;
        phi_full_range : boolean;
        phi_w1_upper_limit : std_logic_vector;
        phi_w1_lower_limit : std_logic_vector;
        phi_w2_ignore : boolean;
        phi_w2_upper_limit : std_logic_vector;
        phi_w2_lower_limit : std_logic_vector;
        requested_charge: string(1 to 3);
        qual_lut : std_logic_vector;
        iso_lut : std_logic_vector
    );
    port(
        data_i : in std_logic_vector;
        comp_o : out std_logic
    );
end muon_comparators_v2;

architecture rtl of muon_comparators_v2 is

    constant ZERO : std_logic_vector(MAX_MUON_BITS-1 downto 0) := (others => '0');

    signal pt : std_logic_vector(D_S_I_MUON.pt_high downto D_S_I_MUON.pt_low);
    signal eta : std_logic_vector(D_S_I_MUON.eta_high downto D_S_I_MUON.eta_low);
    signal phi : std_logic_vector(D_S_I_MUON.phi_high downto D_S_I_MUON.phi_low);
    signal qual : std_logic_vector(D_S_I_MUON.qual_high downto D_S_I_MUON.qual_low);
    signal iso : std_logic_vector(D_S_I_MUON.iso_high downto D_S_I_MUON.iso_low);
    signal charge : std_logic_vector(D_S_I_MUON.charge_high downto D_S_I_MUON.charge_low);

    signal pt_comp_o : std_logic;
    signal eta_comp_o : std_logic;
    signal phi_comp_o : std_logic;
    signal qual_comp_o : std_logic;
    signal iso_comp_o : std_logic;
    signal charge_comp_o : std_logic;
    signal eta_comp_w1 : std_logic;
    signal eta_comp_w2 : std_logic;
    signal phi_comp_w1 : std_logic;
    signal phi_comp_w2 : std_logic;
    
    signal no_muon : std_logic;

begin

-- HB 2014-04-14
-- DEFINITION of charge:
-- charge valid = '1' => valid
-- charge sign = '0' => positive, charge sign = '1' => negative

-- ************************************************
-- HB 2014-04-14
-- DEFINITION of muon_comparators:
-- Pt greater/equal pt_threshold
-- AND
-- Eta in range
-- AND
-- Phi in range
-- AND
-- Requested charge
-- AND
-- Quality LUT
-- AND
-- ISO LUT
-- ************************************************

    pt  <= data_i(D_S_I_MUON.pt_high downto D_S_I_MUON.pt_low);
    eta <= data_i(D_S_I_MUON.eta_high downto D_S_I_MUON.eta_low);
    phi <= data_i(D_S_I_MUON.phi_high downto D_S_I_MUON.phi_low);
    qual <= data_i(D_S_I_MUON.qual_high downto D_S_I_MUON.qual_low);
    iso <= data_i(D_S_I_MUON.iso_high downto D_S_I_MUON.iso_low);
    charge <= data_i(D_S_I_MUON.charge_high downto D_S_I_MUON.charge_low);
    
-- HB 2015-08-28: inserted check for "no muon" (all object parameters = 0)
    no_muon <= '1' when data_i = ZERO else '0';

    pt_comp_o <= '1' when ((pt >= pt_threshold and pt_ge_mode=true) or (pt = pt_threshold and pt_ge_mode=false)) else '0';

-- Comparator for pseudorapidity (eta)
-- Eta scale is defined with Two's Complement notation values for HW index.
-- Therefore a comparison with "signed" is implemented, which needs ieee.std_logic_signed.all library.
-- The comparators for et and phi work unsigned, so a module for Eta comparators is instantiated,
-- in which ieee.std_logic_signed.all library is used.

    eta_full_range_i: if eta_full_range = true generate
        eta_comp_o <= '1';
    end generate eta_full_range_i;

    not_eta_full_range_i: if eta_full_range = false generate
        eta_w1_comp_i: entity work.eta_comp_signed
            generic map(
                eta_upper_limit => eta_w1_upper_limit(D_S_I_MUON.eta_high-D_S_I_MUON.eta_low downto 0),
                eta_lower_limit => eta_w1_lower_limit(D_S_I_MUON.eta_high-D_S_I_MUON.eta_low downto 0)
            )    
        port map( 
                eta => eta(D_S_I_MUON.eta_high downto D_S_I_MUON.eta_low),
                eta_comp => eta_comp_w1
        );

        not_eta_w2_ignore_i: if eta_w2_ignore = false generate
            eta_w2_comp_i: entity work.eta_comp_signed
                generic map(
                    eta_upper_limit => eta_w2_upper_limit(D_S_I_MUON.eta_high-D_S_I_MUON.eta_low downto 0),
                    eta_lower_limit => eta_w2_lower_limit(D_S_I_MUON.eta_high-D_S_I_MUON.eta_low downto 0)
                )    
                port map( 
                    eta => eta(D_S_I_MUON.eta_high downto D_S_I_MUON.eta_low),
                    eta_comp => eta_comp_w2
                );
        end generate not_eta_w2_ignore_i;

        eta_w2_ignore_i: if eta_w2_ignore = true generate
            eta_comp_w2 <= '0';
        end generate eta_w2_ignore_i;

        eta_comp_o <= eta_comp_w1 or eta_comp_w2;

    end generate not_eta_full_range_i;

-- Comparator for azimuth angle (phi)
-- Two "windows"-comparartors used.
    phi_full_range_i: if phi_full_range = true generate
        phi_comp_o <= '1';
    end generate phi_full_range_i;

    not_phi_full_range_i: if phi_full_range = false generate
        phi_comp_w1 <= '1' when phi_w1_upper_limit < phi_w1_lower_limit and (phi <= phi_w1_upper_limit or phi >= phi_w1_lower_limit) else
                       '1' when phi_w1_upper_limit > phi_w1_lower_limit and (phi <= phi_w1_upper_limit and phi >= phi_w1_lower_limit) else
                       '1' when phi_w1_upper_limit = phi_w1_lower_limit else '0';

        not_phi_w2_ignore_i: if phi_w2_ignore = false generate
            phi_comp_w2 <= '1' when phi_w2_upper_limit < phi_w2_lower_limit and (phi <= phi_w2_upper_limit or phi >= phi_w2_lower_limit) else
                           '1' when phi_w2_upper_limit > phi_w2_lower_limit and (phi <= phi_w2_upper_limit and phi >= phi_w2_lower_limit) else
                           '1' when phi_w2_upper_limit = phi_w2_lower_limit else '0';
        end generate not_phi_w2_ignore_i;

        phi_w2_ignore_i: if phi_w2_ignore = true generate
            phi_comp_w2 <= '0';
        end generate phi_w2_ignore_i;

        phi_comp_o <= phi_comp_w1 or phi_comp_w2;

    end generate not_phi_full_range_i;

-- Comparator for requested charge
-- charge_high = charge valid, charge_low = charge sign (positive or negative), 
    charge_comp_o <= '1' when charge = "10" and requested_charge = "pos" else -- charge sign = '0' => positive
                     '1' when charge = "11" and requested_charge = "neg" else -- charge sign = '1' => negative
                     '1' when requested_charge = "ign" else '0';

-- Comparator for quality bits with LUT
    qual_comp_o <= qual_lut(CONV_INTEGER(qual)); -- 16 bit LUT for quality, because of 4 bit quality

-- Comparator for ISO bits with LUT
    iso_comp_o <= iso_lut(CONV_INTEGER(iso)); -- 4 bit LUT for isolation, because of 2 bits isolation

-- Comparators AND
--     comp_o <= pt_comp_o and eta_comp_o and phi_comp_o and qual_comp_o and iso_comp_o and charge_comp_o;
    comp_o <= pt_comp_o and eta_comp_o and phi_comp_o and qual_comp_o and iso_comp_o and charge_comp_o and not no_muon;

end architecture rtl;