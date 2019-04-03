### Build mp7_ugt firmware with IPBB ###

* This is a draft description with branches of MP7 and ugt repos.
* A fork of [MP7](https://gitlab.cern.ch/hbergaue/mp7) firmware is available with three branches:
  - branch "mp7fw_v2_4_1_mp7_ugt" created from tag mp7fw_v2_4_1.
  - branch "mp7fw_v2_4_3_mp7_ugt" created from tag mp7fw_v2_4_3.
  - branch "mp7fw_master_mp7_ugt" created from master.
* These branches contain modified MP7 files for mp7_ugt:
  - area_constraints.tcl
  - mp7_brd_decl.vhd
  - mp7xe_690.vhd
* One of these branches can be used for build (see below).

* The ugt repo is a fork of [svn2git ugt](https://gitlab.cern.ch/cms-cactus/svn2git/firmware/ugt) repo.
Following modifications are done in the branch:
  - added [ugt_strategy.tcl](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/firmware/ucf/ugt_strategy.tcl) for ugt specific strategy and inserted it
into [top.dep](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/firmware/cfg/top.dep).
  - modified [uGT_algo.dep](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/firmware/cfg/uGT_algo.dep): removed "doubled" commands (these commnads are in MP7 dep files).
  - added script [runIpbbSynth.py](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/scripts/runIpbbSynth.py) for IPBB synthesis (all 6 mp7_ugt modules).
  - added script [checkIpbbSynth.py](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/scripts/checkIpbbSynth.py) for checking IPBB synthesis results.
  - added script [fwpackerIpbb.py](https://gitlab.cern.ch/hbergaue/ugt/blob/master/mp7_ugt/scripts/fwpackerIpbb.py) for packing firware files in a tar file.

### Setup using script ###

    # Run kerberos for outside of CERN network
    kinit username@CERN.CH

    # Make local clone of ugt repositiory
    git clone https://gitlab.cern.ch/hbergaue/ugt.git <local path>
    cd <local path>
    
    # Run synthesis script (for all 6 modules)
    python mp7_ugt/scripts/runIpbbSynth.py <vivado version [2018.2]> -t <MP7 tag [mp7fw_v2_4_3]> -p <work dir> -m <menu path> -b <build version> --ugt <ugt master, branch or tag name>

### Setup (commands for one module) ###

    # Run kerberos for outside of CERN network
    kinit username@CERN.CH

    # Download and install ipbb
    curl -L https://github.com/ipbus/ipbb/archive/v0.2.8.tar.gz | tar xvz
    source ipbb-0.2.8/env.sh

    # Create a local working area
    ipbb init <work dir>/mp7_ugt/<mp7fw version>/<menu version>/<build version>/module_<module number>
    cd <work dir>/mp7_ugt/<mp7fw version>/<menu version>/<build version>/module_<module number>
    ipbb add git https://github.com/ipbus/ipbus-firmware.git -b master
    ipbb add git https://:@gitlab.cern.ch:8443/hbergaue/mp7.git -b mp7fw_v2_4_1_mp7_ugt
    ipbb add git https://:@gitlab.cern.ch:8443/hbergaue/ugt.git -b <master or branch name or tag name>

    # Copy VHDL producer output and patched files to mp7_ugt (gtl_module.vhd, gtl_pkg.vhd,
    algo_mapping_rop.vhd and gt_mp7_top_pkg.vhd)

    # Source Vivado
    
    # Create project 
    ipbb proj create vivado mp7_ugt_<build version>_<module number> mp7:../ugt/mp7_ugt
    cd proj/mp7_ugt_<build version>_<module number>
    ipbb vivado project

    # Run implementation, synthesis
    ipbb vivado synth
    ipbb vivado impl
    
    # Generate a bitfile
    ipbb vivado package
    deactivate
