#include "data_types.h"
#include <vector>
#include <cassert>

void hwint_to_GTobjects(std::vector<int> in, int negammas, int nmuons, int njets, ETMiss& etMiss, EGamma* egammas, Muon* muons, Jet* jets);
void packed_to_GTObjects(std::vector<uint64_t> in, ETMiss& etMiss, EGamma egammas[NEGAMMAS], Muon muons[NMUONS], Jet jets[NJETS]);
std::vector<double> hwint_to_physical(std::vector<int> in, int negammas, int nmuons, int njets);
std::vector<uint64_t> hwint_to_packed(std::vector<int> in, int negammas, int nmuons, int njets);
std::vector<int> packed_to_hwint(std::vector<uint64_t> in, int negammas, int nmuons, int njets);