//Numpy array shape [26, 64]
//Min -1.375000000000
//Max 1.375000000000
//Number of zeros 1337

#ifndef W2_H_
#define W2_H_

#ifndef __SYNTHESIS__
weight2_t w2[1664];
#else
weight2_t w2[1664] = {0.0000, 0.1250, 0.4375, -0.3125, -0.4375, 0.0000, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.2500, -0.3125, 0.0000, 0.5000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, -0.4375, 0.3750, 0.0000, 0.0000, -0.6250, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.5000, 0.0000, 0.0000, -0.4375, -0.2500, 0.0000, 0.6875, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.5000, 0.5000, -0.4375, 0.0000, -0.3750, 0.0000, -0.2500, 0.0000, 0.0000, 0.3750, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.3125, 0.0000, 1.1875, 0.0000, -0.6875, -0.6875, -0.2500, 0.3125, 0.4375, 0.6875, 0.5000, 0.0000, -0.3125, 0.0000, 0.7500, 0.0000, 0.0000, 0.3125, 0.3125, -0.5000, 0.0000, 0.6875, -0.5000, 0.3125, 0.6875, -0.2500, -0.4375, -0.2500, -0.5625, -0.3750, 0.2500, -0.7500, 0.0000, -0.7500, 0.0000, 0.8750, -0.0625, 0.0000, 0.5625, 0.0000, 0.3125, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.3125, -0.2500, 0.3125, 0.0000, 0.3125, 0.0000, 0.2500, 0.0000, -0.3750, 0.0000, -0.4375, -0.5000, -0.8750, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, -0.3125, -0.3750, -0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.6250, 0.0000, -0.6250, 0.0000, 0.0000, 0.0000, 0.2500, 0.3125, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.6250, 0.2500, 0.0000, -0.3750, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.3750, 0.3750, 0.0000, 0.0000, 0.2500, 0.0000, -0.5000, -0.4375, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, 0.0000, 0.0000, 0.5000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, -0.4375, 0.0000, 0.5000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.2500, 0.0000, -0.3750, -0.7500, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, -0.6875, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, -0.1875, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.4375, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.3125, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, -0.3750, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.1875, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.5625, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.7500, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.3125, 0.0000, 0.3125, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, -0.3125, 0.3750, 0.2500, 0.0000, 0.0000, 0.0625, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.3125, 0.0000, 0.3750, -0.0625, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, -0.6250, -0.2500, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, -0.5625, -0.5625, 0.2500, 0.4375, 0.0000, 0.3750, 0.3750, -0.1875, 0.0000, 0.0000, 0.3125, -0.4375, 0.0000, 0.3125, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.4375, -0.3750, -0.8125, 0.0000, -0.5625, 0.0000, 0.0000, -0.5625, 0.0000, 0.0000, 0.0000, 0.5000, -1.1875, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.6250, 0.0000, 0.5000, 0.0000, 0.0000, 0.0000, 0.4375, 0.4375, 0.0000, -0.2500, -0.5625, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.1250, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, -0.5625, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.3125, -0.0625, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, -0.3125, 0.0000, 0.3750, -0.2500, 0.0000, 0.0000, 0.3125, 0.3125, 0.0000, 0.4375, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, -0.2500, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, -0.1250, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.0625, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.2500, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 1.3750, 0.0000, -0.3750, -0.6250, 0.0000, 0.0000, 0.3125, 0.4375, 0.0000, 0.0625, -0.3125, 0.0000, 0.4375, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, -0.5000, 0.0000, -0.3125, 0.0000, 0.6250, -0.3125, -1.3750, 0.0000, -0.6875, 0.0000, 0.3750, -0.5000, 0.0000, 0.0000, -0.2500, 0.3125, -0.1250, 0.0000, 0.1875, 0.3125, 0.0000, 0.0000, -0.3125, -0.2500, 0.0000, 0.0000, 0.4375, 0.3750, -0.3750, 0.0000, 0.0000, 0.0000, 0.5000, 0.2500, -0.3750, 0.0000, 0.0000, -0.4375, 0.0000, -0.8750, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.4375, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, -0.2500, -0.4375, 0.2500, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.6875, -0.3125, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.5000, 0.0000, 0.0000, 0.0000, 0.0000, -0.1250, -0.6250, -0.3750, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.1250, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.3750, 0.0000, 0.0000, 0.0000, -0.5000, 0.0000, -0.3750, -0.4375, 0.0000, 0.0000, 0.0000, 0.0000, -0.3750, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.3125, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, -0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.2500, 0.0000, 0.0000, 0.2500, 0.2500, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000};
#endif

#endif
