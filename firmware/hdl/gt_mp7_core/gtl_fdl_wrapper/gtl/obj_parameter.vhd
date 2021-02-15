
-- Description:
-- Condition module for all combination conditions.

-- Version history:
-- HB 2021-02-15: first design.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.gtl_pkg.all;

entity obj_parameter is
     generic(
        nr_obj: natural := NR_EG_OBJECTS;
        type_obj : natural := EG_TYPE
    );
    port(
        calo: in calo_objects_array(0 to nr_obj-1) := (others => (others => '0'));
        esums: in std_logic_vector(MAX_ESUMS_BITS-1 downto 0) := (others => 0);
        muon: in muon_objects_array(0 to NR_MU_OBJECTS-1) := (others => (others => '0'));
        phi_conv_2_muon_phi_integer: in diff_integer_inputs_array(0 to nr_obj-1) := (others => 0);
        pt_vector: out diff_inputs_array(0 to nr_obj-1) := (others => (others => '0'));
        upt_vector: out diff_inputs_array(0 to NR_MU_OBJECTS-1) := (others => (others => '0'));
        eta_integer: out diff_integer_inputs_array(0 to nr_obj-1) := (others => 0);
        phi_integer: out diff_integer_inputs_array(0 to nr_obj-1) := (others => 0);
        cos_phi: out sin_cos_integer_array(0 to nr_obj-1) := (others => 0);
        sin_phi: out sin_cos_integer_array(0 to nr_obj-1) := (others => 0);
        conv_cos_phi: out sin_cos_integer_array(0 to nr_obj-1) := (others => 0);
        conv_sin_phi: out sin_cos_integer_array(0 to nr_obj-1) := (others => 0)
    );
end obj_parameter;

architecture rtl of obj_parameter is

    signal eta_high, eta_low, phi_high, phi_low : natural;

begin

        eg_ranges_i: if type_obj = EG_TYPE generate
            eta_high <= D_S_I_EG_V2.eta_high;
            eta_low <= D_S_I_EG_V2.eta_low;
            phi_high <= D_S_I_EG_V2.phi_high;
            phi_low <= D_S_I_EG_V2.phi_low;
        end generate eg_ranges_i;

        jet_ranges_i: if type_obj = JET_TYPE generate
            eta_high <= D_S_I_JET_V2.eta_high;
            eta_low <= D_S_I_JET_V2.eta_low;
            phi_high <= D_S_I_JET_V2.phi_high;
            phi_low <= D_S_I_JET_V2.phi_low;
        end generate jet_ranges_i;

        tau_ranges_i: if type_obj = TAU_TYPE generate
            eta_high <= D_S_I_TAU_V2.eta_high;
            eta_low <= D_S_I_TAU_V2.eta_low;
            phi_high <= D_S_I_TAU_V2.phi_high;
            phi_low <= D_S_I_TAU_V2.phi_low;
        end generate tau_ranges_i;

        etm_ranges_i: if type_obj = ETM_TYPE generate
            phi_high <= D_S_I_ETM_V2.phi_high;
            phi_low <= D_S_I_ETM_V2.phi_low;
        end generate etm_ranges_i;

        htm_ranges_i: if type_obj = HTM_TYPE generate
            phi_high <= D_S_I_HTM_V2.phi_high;
            phi_low <= D_S_I_HTM_V2.phi_low;
        end generate htm_ranges_i;

        etmhf_ranges_i: if type_obj = ETMHF_TYPE generate
            phi_high <= D_S_I_ETMHF_V2.phi_high;
            phi_low <= D_S_I_ETMHF_V2.phi_low;
        end generate etmhf_ranges_i;

        htmhf_ranges_i: if type_obj = HTMHF_TYPE generate
            phi_high <= D_S_I_HTMHF_V2.phi_high;
            phi_low <= D_S_I_HTMHF_V2.phi_low;
        end generate htmhf_ranges_i;

        nr_obj_l: for i in 0 to nr_obj-1 generate
            muon_i: if type_obj = MU_TYPE generate
                pt_vector(i)(MU_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(MU_PT_LUT(CONV_INTEGER(muon(i)(D_S_I_MU_V2.pt_high downto D_S_I_MU_V2.pt_low))), MU_PT_VECTOR_WIDTH);
                upt_vector(i)(MU_UPT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(MU_UPT_LUT(CONV_INTEGER(muon(i)(D_S_I_MU_V2.upt_high downto D_S_I_MU_V2.upt_low))), MU_UPT_VECTOR_WIDTH);
                eta_integer(i) <= CONV_INTEGER(signed(muon(i)(D_S_I_MU_V2.eta_high downto D_S_I_MU_V2.eta_low)));
                phi_integer(i) <= CONV_INTEGER(muon(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low));
                cos_phi(i) <= MUON_COS_PHI_LUT(CONV_INTEGER(muon(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
                sin_phi(i) <= MUON_SIN_PHI_LUT(CONV_INTEGER(muon(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
            end generate muon_i;
            eg_pt_i: if type_obj = EG_TYPE generate
                pt_vector(i)(EG_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(EG_PT_LUT(CONV_INTEGER(calo(i)(D_S_I_EG_V2.et_high downto D_S_I_EG_V2.et_low))), EG_PT_VECTOR_WIDTH);
            end generate eg_pt_i;
            jet_pt_i: if type_obj = JET_TYPE generate
                pt_vector(i)(JET_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(JET_PT_LUT(CONV_INTEGER(calo(i)(D_S_I_JET_V2.et_high downto D_S_I_JET_V2.et_low))), JET_PT_VECTOR_WIDTH);
            end generate jet_pt_i;
            tau_pt_i: if type_obj = TAU_TYPE generate
                pt_vector(i)(TAU_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(TAU_PT_LUT(CONV_INTEGER(calo(i)(D_S_I_TAU_V2.et_high downto D_S_I_TAU_V2.et_low))), TAU_PT_VECTOR_WIDTH);
            end generate tau_pt_i;
            calo_i: if type_obj = (EG_TYPE or JET_TYPE or TAU_TYPE) generate
                eta_integer(i) <= CONV_INTEGER(signed(calo(i)(eta_high downto eta_low)));
                phi_integer(i) <= CONV_INTEGER(calo(i)(phi_high downto phi_low));
                cos_phi(i) <= CALO_COS_PHI_LUT(CONV_INTEGER(calo(i)(phi_high downto phi_low)));
                sin_phi(i) <= CALO_SIN_PHI_LUT(CONV_INTEGER(calo(i)(phi_high downto phi_low)));
                conv_cos_phi(i) <= MUON_COS_PHI_LUT(phi_conv_2_muon_phi_integer(i));
                conv_sin_phi(i) <= MUON_SIN_PHI_LUT(phi_conv_2_muon_phi_integer(i));
            end generate calo_i;
        end generate nr_obj_l;

        etm_pt_i: if type_obj = ETM_TYPE generate
            pt_vector(0)(ETM_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(ETM_PT_LUT(CONV_INTEGER(esums(D_S_I_ETM_V2.et_high downto D_S_I_ETM_V2.et_low))), ETM_PT_VECTOR_WIDTH);
        end generate etm_pt_i;
        htm_pt_i: if type_obj = HTM_TYPE generate
            pt_vector(0)(HTM_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(HTM_PT_LUT(CONV_INTEGER(esums(D_S_I_HTM_V2.et_high downto D_S_I_HTM_V2.et_low))), HTM_PT_VECTOR_WIDTH);
        end generate htm_pt_i;
        etmhf_pt_i: if type_obj = ETMHF_TYPE generate
            pt_vector(0)(ETMHF_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(ETMHF_PT_LUT(CONV_INTEGER(esums(D_S_I_ETMHF_V2.et_high downto D_S_I_ETMHF_V2.et_low))), ETMHF_PT_VECTOR_WIDTH);
        end generate etmhf_pt_i;
        htmhf_pt_i: if type_obj = HTMHF_TYPE generate
            pt_vector(0)(HTMHF_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(HTMHF_PT_LUT(CONV_INTEGER(esums(D_S_I_HTMHF_V2.et_high downto D_S_I_HTMHF_V2.et_low))), HTMHF_PT_VECTOR_WIDTH);
        end generate htmhf_pt_i;
        esums_i: if type_obj = (ETM_TYPE or HTM_TYPE or ETMHF_TYPE or HTMHF_TYPE) generate
            phi_integer(0) <= CONV_INTEGER(esums(phi_high downto phi_low));
            cos_phi(0) <= CALO_COS_PHI_LUT(CONV_INTEGER(esums(phi_high downto phi_low)));
            sin_phi(0) <= CALO_SIN_PHI_LUT(CONV_INTEGER(esums(phi_high downto phi_low)));
            conv_cos_phi(0) <= MUON_COS_PHI_LUT(phi_conv_2_muon_phi_integer(0));
            conv_sin_phi(0) <= MUON_SIN_PHI_LUT(phi_conv_2_muon_phi_integer(0));
        end generate esums_i;

end architecture rtl;
