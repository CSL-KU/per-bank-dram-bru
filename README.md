This is the main repo for the RTAS 2026 paper: "Per-Bank Memory Bandwidth Regulation for Predictable and Performant Real-Time Systems". It contains all of the code needed for FireSim evaluation reproduction. The useful links section will direct you to the main source code as well as the other repos related to this work.

## Useful Links

- [Artifacts for devboard evaluation (Figs 1-3)](https://github.com/CSL-KU/per-bank-dram-artifacts)
- [DRAMA++ tool](https://github.com/CSL-KU/drama-pp)
- [RTL for MSHR regulator](https://github.com/crsullivan13/rocket-chip-inclusive-cache/tree/mshr-reg2.0-perbank) (mshr-reg2.0 for allbank version)
- [RTL for Tagging Unit](https://github.com/crsullivan13/BwReg/tree/dram-reg-forward-per-bank) (dram-reg-forward for allbank version)

## Using this repo

Remeber that our evaluation assumes VCU118 board as the FPGA platform and should not be expected to work out of the box on other boards.

Start by following the [FireSim setup docs for version 1.18.0](https://docs.fires.im/en/1.18.0/). Once you get to the portion of the setup where you need to clone a repo, clone this one instead:

```
git clone https://github.com/CSL-KU/per-bank-dram-bru.git
git checkout rtas26
```

Then proceed with the setup as usual. Once done with the setup, run the following to cleanup any issues in the setup and put your local onto the perbank version of the code:

```
export FIRESIM_ROOT=$(pwd) # assuming you are at the root of the firesim repo you cloned
./version-setup.sh
```
