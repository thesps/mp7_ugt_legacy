#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "../pybind11_bridge.h"
#include "anomaly_detection/anomaly_detection.h"
#include "anomaly_detection/NN/VAE_HLS.h"

namespace py = pybind11;

// 'bridge' function for Python binding (not for firmware)
double hwint_to_anomaly_score(std::vector<int> in){

    assert((void("Wrong number of inputs"), in.size() == 3*(AD_NEGAMMAS+AD_NMUONS+AD_NJETS+1)));
    // read (pT, eta, phi) for each of (in order): MET, electrons, muons, jets

    // Convert ints to GT objects
    ETMiss etMiss;
    EGamma egammas[NEGAMMAS];
    Muon muons[NMUONS];
    Jet jets[NJETS];
    hwint_to_GTobjects(in, AD_NEGAMMAS, AD_NMUONS, AD_NJETS, etMiss, egammas, muons, jets);

    // the unused inputs
    Tau taus[NTAUS]; ET et; HT ht; HTMiss htmiss; ETHFMiss ethfmiss; HTHFMiss hthfmiss; 
    AD_NN_OUT_SQ_T score;
    anomaly_detection(muons, jets, egammas, taus, et, ht, etMiss, htmiss, ethfmiss, hthfmiss, score);
    return (double) score;
}

// 'bridge' function for Python binding (not for firmware)
double objects_to_anomaly_score(ETMiss etMiss, std::vector<EGamma> egammas, std::vector<Muon> muons, std::vector<Jet> jets){

    assert((void("Wrong number of inputs"), egammas.size() == AD_NEGAMMAS));
    assert((void("Wrong number of inputs"), muons.size() == AD_NMUONS));
    assert((void("Wrong number of inputs"), jets.size() == AD_NJETS));
    // Convert ints to GT objects
    EGamma egammas_int[NEGAMMAS];
    Muon muons_int[NMUONS];
    Jet jets_int[NJETS];
    for(int i = 0; i < NEGAMMAS; i++){
        if(i < AD_NEGAMMAS){ egammas_int[i] = egammas[i]; }
        else{ egammas_int[i].clear(); }
    }
    for(int i = 0; i < NMUONS; i++){
        if(i < AD_NMUONS){ muons_int[i] = muons[i]; }
        else{ muons_int[i].clear(); }
    }
    for(int i = 0; i < NJETS; i++){
        if(i < AD_NJETS){ jets_int[i] = jets[i]; }
        else{ jets_int[i].clear(); }
    }

    // the unused inputs
    Tau taus[NTAUS]; ET et; HT ht; HTMiss htmiss; ETHFMiss ethfmiss; HTHFMiss hthfmiss; 
    AD_NN_OUT_SQ_T score;
    anomaly_detection(muons_int, jets_int, egammas_int, taus, et, ht, etMiss, htmiss, ethfmiss, hthfmiss, score);
    return (double) score;
}

std::vector<AD_NN_OUT_T> nn(std::vector<AD_NN_IN_T> in){
    assert((void("Wrong number of inputs"), in.size() == AD_NNNINPUTS));
    AD_NN_IN_T nn_inputs[AD_NNNINPUTS];
    for(int i = 0; i < AD_NNNINPUTS; i++){
        nn_inputs[i] = in[i];
    }
    AD_NN_OUT_T nn_outputs[AD_NNNOUTPUTS];
    VAE_HLS(nn_inputs, nn_outputs);
    std::vector<AD_NN_OUT_T> out(std::begin(nn_outputs), std::end(nn_outputs));
    return out;
}

AD_NN_OUT_SQ_T nn_loss(std::vector<AD_NN_OUT_T> in){
    assert((void("Wrong number of inputs"), in.size() == AD_NNNOUTPUTS));
    AD_NN_OUT_T nn_outputs[AD_NNNOUTPUTS];
    for(int i = 0; i < AD_NNNOUTPUTS; i++){
        nn_outputs[i] = in[i];
    }
    AD_NN_OUT_SQ_T loss = computeLoss(nn_outputs);
    return loss;
}

void bind_anomaly_detection(py::module &m){
  py::module adtm = m.def_submodule("anomaly_detection", "Anomaly Detection Module");
    adtm.def("hwint_to_anomaly_score", &hwint_to_anomaly_score, "GT inputs (in integer hardware units) to anomaly score");
    adtm.def("objects_to_anomaly_score", &objects_to_anomaly_score, "GT inputs (in integer hardware units) to anomaly score");
    adtm.def("nn", &nn, "Scaled NN inputs (in doubles) to NN outputs (in doubles)");
    adtm.def("nn_loss", &nn_loss, "NN outputs (in doubles) to NN loss score from computeLoss (in doubles)");
    adtm.attr("AD_NMUONS") = &AD_NMUONS;
    adtm.attr("AD_NJETS") = &AD_NJETS;
    adtm.attr("AD_NEGAMMAS") = &AD_NEGAMMAS;
    adtm.attr("AD_NTAUS") = &AD_NTAUS;
    adtm.attr("AD_NNNPARTICLES") = &AD_NNNPARTICLES;
    adtm.attr("AD_NNNINPUTS") = &AD_NNNINPUTS;
    adtm.attr("AD_NNNOUTPUTS") = &AD_NNNOUTPUTS;
}