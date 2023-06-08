//Numpy array shape [32, 16]
//Min -4.000000000000
//Max 1.125000000000
//Number of zeros 131

#ifndef W4_H_
#define W4_H_

#ifndef __SYNTHESIS__
weight4_t w4[512];
#else
weight4_t w4[512] = {0.250, -4.000, -4.000, 0.000, 0.375, -0.125, 0.125, 0.125, 0.375, 0.250, -0.250, 0.375, -0.125, 0.125, 0.000, -0.250, 0.000, -4.000, -4.000, 0.000, 0.125, 0.375, -0.125, 0.500, 0.000, 0.000, 0.000, -0.125, -0.625, 0.000, 0.000, 0.125, 0.125, -4.000, -4.000, 0.125, -0.125, -0.125, 0.000, 0.125, -0.125, 0.000, -0.125, 0.250, 0.125, 0.250, 0.000, -0.125, -0.125, -4.000, -4.000, 0.250, 0.125, 0.000, 0.125, 0.250, 0.000, 0.125, 0.000, 0.125, -0.250, 0.000, 0.000, -0.250, 0.000, -4.000, -4.000, 0.125, 0.000, -0.500, 0.125, 0.125, 0.000, -0.125, 0.125, 0.125, 0.375, 0.000, 0.000, 0.125, 0.000, -4.000, -4.000, 0.125, 0.125, 0.000, -0.125, 0.125, -0.625, -0.500, -0.500, 0.000, 0.000, 0.375, 0.125, -0.125, 0.125, -4.000, -4.000, 0.125, -0.125, -0.125, -0.125, 0.375, 0.125, 0.250, -0.125, 0.250, -0.250, -0.125, -0.125, -0.125, 0.125, -4.000, -4.000, 0.000, -0.125, 0.000, -0.250, -0.125, 0.125, 0.000, -0.125, 0.125, -0.125, 0.000, -0.125, 0.625, 0.125, -4.000, -4.000, 0.375, -0.125, 0.000, 0.000, 0.125, 0.125, 0.125, 0.125, -0.125, -0.125, 0.125, 0.125, -0.375, 0.000, -4.000, -4.000, 0.125, 0.000, 0.375, 0.000, -0.375, 0.125, 0.000, 0.125, 0.125, 0.375, 0.000, 0.250, -0.375, -0.125, -4.000, -4.000, 0.250, 0.000, -0.125, -0.125, -0.125, 0.750, -0.250, -0.125, 0.125, -0.125, 0.000, 0.125, -0.250, 0.000, -4.000, -4.000, -0.125, 0.000, 0.000, 0.000, 0.000, -0.625, 0.500, 0.250, 0.125, -0.125, 0.250, 0.000, 0.000, -0.125, -4.000, -4.000, -0.500, 0.125, 0.000, 0.000, 0.000, 0.125, -0.125, 0.250, 0.250, 0.000, -0.125, -0.250, 0.000, 0.000, -4.000, -4.000, -0.125, 0.250, 0.000, -0.125, 0.000, -0.250, -0.250, 0.125, 0.125, 0.000, 0.000, -0.125, -0.375, -0.125, -4.000, -4.000, -0.250, -0.125, 0.000, -0.125, 0.000, 0.125, 0.000, 0.000, 0.375, -0.125, -0.375, 0.125, -0.375, -0.250, 1.125, -4.000, 0.125, 0.125, -0.125, 0.750, 0.000, -0.125, 0.000, -0.125, 0.250, 0.000, -0.125, 0.000, 0.125, 0.000, -4.000, -4.000, 0.125, 0.000, 0.000, -0.125, 0.125, 0.000, -0.125, -0.125, 0.125, -0.125, 0.000, 0.250, 0.125, 0.250, -4.000, -3.750, -0.125, -0.250, 0.000, -0.500, 0.000, 0.125, -0.125, 0.375, 0.000, -0.125, 0.000, 0.125, 0.000, 0.000, -4.000, -4.000, -0.125, 0.125, -0.500, 0.250, 0.000, 0.125, 0.125, 0.125, 0.000, 0.000, -0.375, 0.500, 0.125, 0.250, -4.000, -4.000, -0.125, 0.125, 0.000, -0.500, 0.250, 0.125, 0.000, 0.125, 0.000, -0.250, 0.000, 0.250, -0.125, 0.125, -4.000, -4.000, 0.125, 0.250, -0.250, -0.625, 0.000, 0.000, 0.125, 0.000, 0.250, -0.250, -2.375, 0.000, -0.500, 0.375, -4.000, -4.000, -0.125, 0.000, 0.000, -0.375, 0.000, 0.000, 0.000, 0.250, -0.125, 0.000, 0.000, 0.000, -0.125, -0.375, -4.000, -4.000, 0.125, 0.000, 0.000, -0.125, -0.125, 0.250, 0.500, 0.250, 0.125, -0.125, -0.250, -0.250, -0.375, -0.125, -4.000, -4.000, 0.250, 0.125, -0.125, 0.125, -0.250, 0.125, 0.250, -0.125, 0.000, 0.250, 0.000, -0.250, -0.250, 0.000, -4.000, -4.000, 0.375, -0.250, 0.000, -0.125, 0.000, 0.000, 0.125, -0.125, 0.000, -0.250, -0.125, 0.375, -0.125, 0.000, -4.000, -4.000, 0.125, 0.250, -0.375, 0.000, 0.000, 0.125, 0.000, 0.375, -0.250, 0.000, -0.625, -0.125, 0.250, -0.250, -4.000, -4.000, 0.000, 0.125, -0.250, 0.000, 0.000, 0.250, 0.250, 0.000, -0.125, 0.000, -0.125, 0.000, -0.500, 0.000, -4.000, -4.000, 0.000, 0.250, 0.375, 0.125, 0.250, 0.125, 0.125, 0.000, -0.125, 0.125, 0.000, 0.125, -0.500, 0.250, -4.000, -4.000, 0.375, 0.250, -0.125, -0.250, 0.000, -0.250, -0.125, -0.125, 0.000, -0.125, -0.125, 0.000, -0.250, 0.125, -4.000, -4.000, -0.125, 0.125, 0.375, -0.125, -0.375, 0.000, 0.000, 0.000, -0.125, 0.250, 0.125, 0.000, 0.250, 0.000, -3.125, -4.000, 0.000, 0.250, -0.125, -0.125, 0.125, 0.000, -0.125, 0.125, -0.250, -0.125, 0.125, 0.125, -0.375, 0.250, 1.000, -3.875, 0.000, 0.000, -0.375, -0.500, -0.125, 0.125, 0.250, 0.125, 0.250, 0.375, 0.000, -0.125, 0.125};
#endif

#endif
