#ifndef VAE_HLS_H_
#define VAE_HLS_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

#include "defines.h"

// Prototype of top level function for C-synthesis
void VAE_HLS(
    input_t input_3[N_INPUT_1_1],
    result_t layer7_out[N_LAYER_6]
);

#endif
