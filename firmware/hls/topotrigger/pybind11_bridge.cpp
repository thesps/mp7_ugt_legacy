#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "../pybind11_bridge.h"
#include "topotrigger/topo_trigger.h"
#include "topotrigger/NN/TOPO_HLS.h"

std::vector<double> hwint_scaling(std::vector<int> in) {
    
    assert((void("Wrong number of inputs"), in.size() == 2 + 3 * (TPT_NEGAMMAS + TPT_NMUONS + TPT_NJETS)  ));
    
    // Convert ints to GT objects
    ETMiss etMiss;
    EGamma egammas[NEGAMMAS];
    Muon muons[NMUONS];
    Jet jets[NJETS];
    hwint_to_GTobjects(in, TPT_NEGAMMAS, TPT_NMUONS, TPT_NJETS, etMiss, egammas, muons, jets);
    
    // the unused inputs
    Tau taus[NTAUS]; ET et; HT ht; HTMiss htmiss; ETHFMiss ethfmiss; HTHFMiss hthfmiss; 
    
    unscaled_t nn_inputs_unscaled[TPT_NNNINPUTS];
    unroll_particles(muons, jets, egammas, taus, et, ht, etMiss, htmiss, ethfmiss, hthfmiss, nn_inputs_unscaled);
    
    TPT_NN_IN_T nn_inputs[TPT_NNNINPUTS];
    scaleNNInputs(nn_inputs_unscaled, nn_inputs);
    
    // we need to convert back to a vector to return
    std::vector<double> out;
    for (int i = 0; i < TPT_NNNINPUTS; i++) {
        out.push_back(nn_inputs[i]);
    }
    
    return out;
    
}


// 'bridge' function for Python binding (not for firmware)
double hwint_to_topo_score(std::vector<int> in){

    assert((void("Wrong number of inputs"), in.size() == 2 + 3 * (TPT_NEGAMMAS + TPT_NMUONS + TPT_NJETS)  ));
    // read (pT, eta, phi) for each of (in order): MET, electrons, muons, jets

    // Convert ints to GT objects
    ETMiss etMiss;
    EGamma egammas[NEGAMMAS];
    Muon muons[NMUONS];
    Jet jets[NJETS];
    hwint_to_GTobjects(in, TPT_NEGAMMAS, TPT_NMUONS, TPT_NJETS, etMiss, egammas, muons, jets);

    // the unused inputs
    Tau taus[NTAUS]; ET et; HT ht; HTMiss htmiss; ETHFMiss ethfmiss; HTHFMiss hthfmiss; 
    
    TPT_NN_OUT_T score;
    topo_trigger(muons, jets, egammas, taus, et, ht, etMiss, htmiss, ethfmiss, hthfmiss, score);
    return (double) score;
    
}


// 'bridge' function for Python binding (not for firmware)
double objects_to_topo_score(ETMiss etMiss, std::vector<EGamma> egammas, std::vector<Muon> muons, std::vector<Jet> jets){

    assert((void("Wrong number of inputs"), egammas.size() == TPT_NEGAMMAS));
    assert((void("Wrong number of inputs"), muons.size() == TPT_NMUONS));
    assert((void("Wrong number of inputs"), jets.size() == TPT_NJETS));
    
    // Convert ints to GT objects
    EGamma egammas_int[NEGAMMAS];
    Muon muons_int[NMUONS];
    Jet jets_int[NJETS];
    for(int i = 0; i < NJETS; i++){
        if(i < TPT_NJETS){ jets_int[i] = jets[i]; }
        else{ jets_int[i].clear(); }
    }
    for(int i = 0; i < NMUONS; i++){
        if(i < TPT_NMUONS){ muons_int[i] = muons[i]; }
        else{ muons_int[i].clear(); }
    }
    for(int i = 0; i < NEGAMMAS; i++){
        if(i < TPT_NEGAMMAS){ egammas_int[i] = egammas[i]; }
        else{ egammas_int[i].clear(); }
    }

    // the unused inputs
    Tau taus[NTAUS]; ET et; HT ht; HTMiss htmiss; ETHFMiss ethfmiss; HTHFMiss hthfmiss; 
    
    TPT_NN_OUT_T score;
    topo_trigger(muons_int, jets_int, egammas_int, taus, et, ht, etMiss, htmiss, ethfmiss, hthfmiss, score);
    return (double) score;
    
}


std::vector<TPT_NN_OUT_T> nn(std::vector<TPT_NN_IN_T> in){
    assert((void("Wrong number of inputs"), in.size() == TPT_NNNINPUTS));
    TPT_NN_IN_T nn_inputs[TPT_NNNINPUTS];
    for(int i = 0; i < TPT_NNNINPUTS; i++){
        nn_inputs[i] = in[i];
    }
    TPT_NN_OUT_T nn_outputs[TPT_NNNOUTPUT];
    TOPO_HLS(nn_inputs, nn_outputs, TPT_SIZE_IN, TPT_SIZE_OUT);
    std::vector<TPT_NN_OUT_T> out(std::begin(nn_outputs), std::end(nn_outputs));
    return out;
}

namespace py = pybind11;

void bind_topo_trigger(py::module &m){
  py::module ttm = m.def_submodule("topo_trigger", "Topological Trigger Module");
  ttm.def("hwint_to_topo_score", &hwint_to_topo_score, "GT inputs (in integer hardware units) to topo score");
  ttm.def("objects_to_topo_score", &objects_to_topo_score, "GT inputs (in integer hardware units) to topo score");
  ttm.def("nn", &nn, "Scaled NN inputs (in doubles) to NN outputs (in doubles)");
  ttm.def("hwint_scaling", &hwint_scaling, "hwints normalization");
  ttm.attr("TPT_NMUONS") = &TPT_NMUONS;
  ttm.attr("TPT_NJETS") = &TPT_NJETS;
  ttm.attr("TPT_NEGAMMAS") = &TPT_NEGAMMAS;
  ttm.attr("TPT_NNNPARTICLES") = &TPT_NNNPARTICLES;
  ttm.attr("TPT_NNNINPUTS") = &TPT_NNNINPUTS;
  ttm.attr("TPT_NNNOUTPUT") = &TPT_NNNOUTPUT;
}