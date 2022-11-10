#ifndef __ADT_SCALES_H
#define __ADT_SCALES_H

#include "anomaly_detection.h"

typedef ap_ufixed<12,7> ad_scales_t;
static const ad_scales_t ad_scales[AD_NNNINPUTS] = {
 1.35249945e+01, 1.36141309e+01, 1.00000000e+00, 3.70506098e+00,
 3.68417291e+00, 1.29489751e+01, 1.97191713e+00, 1.96310532e+00,
 6.63686671e+00, 1.33175476e+00, 1.32925472e+00, 4.18319833e+00,
 9.43662392e-01, 9.40232341e-01, 3.17217694e+00, 1.56059770e+00,
 1.68774727e+00, 6.35515274e+00, 2.55698265e-01, 2.43349464e-01,
 1.00248927e+00, 5.46840637e-02, 5.46113399e-02, 2.57229758e-01,
 1.50534937e-02, 1.45448827e-02, 6.90695697e-02, 1.77779353e+01,
 1.78142586e+01, 1.11961278e+02, 1.17817875e+01, 1.17728492e+01,
 8.08226552e+01, 8.28324488e+00, 8.27000703e+00, 5.24870152e+01,
 5.90208183e+00, 5.88725468e+00, 3.59577187e+01, 4.13897708e+00,
 4.12643077e+00, 2.33503114e+01, 2.83879313e+00, 2.82010505e+00,
 1.57143403e+01, 1.88760665e+00, 1.87800946e+00, 9.97374523e+00,
 1.20762077e+00, 1.20177581e+00, 6.29370759e+00, 7.36808815e-01,
 7.33020054e-01, 3.57131671e+00, 4.18147408e-01, 4.19865065e-01,
 2.10402991e+00};

typedef ap_fixed<12,1> ad_offset_t;
static const ad_offset_t ad_offsets[AD_NNNINPUTS] = {
 -3.13342398e+00, -7.83948727e-01,  0.00000000e+00, -2.53022913e-02,
  5.05597802e-02, -2.59917484e-02, -2.40998164e-02,  2.36830419e-02,
 -2.07076020e-01, -1.43157861e-02,  1.42978689e-02,  2.25159430e-01,
 -1.01828981e-02,  7.02786913e-03, -1.14604217e-01, -5.50514583e-03,
 -1.42940927e-03,  7.68319424e-03, -4.04833234e-04,  9.66714821e-05,
 -1.09129583e-03, -1.52481891e-05, -1.23842761e-05, -1.06199614e-04,
 -8.71963338e-06, -3.23908703e-06, -3.70928292e-05,  3.13379531e-01,
  2.86606849e-01,  9.13216481e-01,  9.45980563e-02,  1.67628711e-01,
  3.30552024e-01,  2.62413345e-02,  1.14250842e-01,  5.23518345e-01,
 -2.73820308e-03,  6.30617825e-02, -1.28664671e-02, -8.41142501e-03,
  3.58550224e-02,  2.59179539e-01, -5.04274432e-03,  1.71967209e-02,
  2.49194242e-02, -2.27100370e-03,  1.05731363e-02,  5.30418059e-02,
 -7.36865821e-04,  3.83587018e-03, -3.64639733e-03, -4.09033854e-04,
  1.66984249e-03,  1.45033922e-02, -1.58269852e-04,  1.44457625e-04,
  4.02339726e-04};

#endif