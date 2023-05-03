import ugt_hls as ugt
from ugt_hls import GT_NEGAMMAS, GT_NMUONS, GT_NJETS
from ugt_hls.anomaly_detection import AD_NEGAMMAS, AD_NMUONS, AD_NJETS
from ugt_hls.topo_trigger import TPT_NEGAMMAS, TPT_NMUONS, TPT_NJETS
import h5py
import numpy as np
import tensorflow as tf
from qkeras.utils import _add_supported_quantized_objects
co = {}; _add_supported_quantized_objects(co)

def _assert3D(data):
  assert data.ndim == 3, "Expected 3D inputs: (event, particle, 3-vector)"

def saturate(data):
  _assert3D(data)
  # saturate the MET ET (sometimes we see 4096)
  data[:,0,0][data[:,0,0] >= 4096] = 4095
  return data

# load some data
infile = "BSM_preprocessed.h5"
sample = "haa4b_ma15_powheg"
h5f = h5py.File(infile, 'r')
inval = np.array(h5f[sample])

# just pick the first event
event = inval[1695].astype('int')

# Get the GT ETMiss, EGammas, Muon, and Jet objects from h5
met = ugt.ETMiss.initFromHWInt(event[0][0], event[0][2])
egammas = [ugt.EGamma.initFromHWInt(*event[1+i]) for i in range(AD_NEGAMMAS) ]
muons = [ugt.Muon.initFromHWInt(*event[1+AD_NEGAMMAS+i]) for i in range(AD_NMUONS)]
jets = [ugt.Jet.initFromHWInt(*event[1+AD_NEGAMMAS+AD_NMUONS+i]) for i in range(AD_NJETS)]
event_gt_objects = [met, *egammas, *muons, *jets]

# pack the GT objects to their interface integers
#packed = np.array([o.pack() for o in event_gt_objects])
packed = np.array(ugt.hwint_to_packed(event.flatten(), AD_NEGAMMAS, AD_NMUONS, AD_NJETS), dtype=np.uint64) # old way (still works)
unpacked = np.array(ugt.packed_to_hwint(packed, AD_NEGAMMAS, AD_NMUONS, AD_NJETS), dtype='int').reshape(event.shape) # new way
print(f'Unpacked matches original? {np.all(unpacked == event)}')

# compute the NN loss in one step from integers
adt0 = np.array(ugt.anomaly_detection.hwint_to_anomaly_score(event.flatten()))

# compute the NN loss in one step from GT objects
adt1 = np.array(ugt.anomaly_detection.objects_to_anomaly_score(met, egammas, muons, jets))

# TPT uses fewer objects than ADT, slice to crop
tpt0 = np.array(ugt.topo_trigger.objects_to_topo_score(met, egammas[:TPT_NEGAMMAS], muons[:TPT_NMUONS], jets[:TPT_NJETS]))