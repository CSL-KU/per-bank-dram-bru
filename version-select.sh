#!/bin/bash

# script to switch submodules between perbank and allbank regulators
# the firesim submodule structure was being annoying so doing this instead

if [[ "$1" == "pb" ]]; then
    BWREG_BRANCH="dram-reg-forward-per-bank"
    CACHE_BRANCH="mshr-reg2.0-perbank"
elif [[ "$1" == "ab" ]]; then
    BWREG_BRANCH="dram-reg-forward"
    CACHE_BRANCH="mshr-reg2.0"
else
    echo "Usage: $0 <pb (for perbank)|ab (for allbank)>"
    exit 1
fi

cd $FIRESIM_ROOT/target-design/chipyard/generators/rocket-chip/src/main/scala/subsystem/BwReg
git checkout $BWREG_BRANCH

cd $FIRESIM_ROOT/target-design/chipyard/generators/rocket-chip-inclusive-cache
git checkout $CACHE_BRANCH

cd $FIRESIM_ROOT
