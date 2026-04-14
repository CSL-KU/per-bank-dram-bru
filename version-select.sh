#!/bin/bash

# script to switch submodules between perbank and allbank regulators
# the firesim submodule structure was being annoying so doing this instead

if [[ -z "$FIRESIM_ROOT" ]]; then
    echo "Error: FIRESIM_ROOT is not set. Please set it to your FireSim root directory (e.g., export FIRESIM_ROOT=/path/to/firesim)."
    exit 1
fi

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

BWREG_PATH="$FIRESIM_ROOT/target-design/chipyard/generators/rocket-chip/src/main/scala/subsystem/BwReg"
if [[ -z "$(ls -A "$BWREG_PATH" 2>/dev/null)" ]]; then
    echo "BwReg submodule is empty, initializing..."
    git -C "$FIRESIM_ROOT/target-design/chipyard/generators/rocket-chip" submodule update --init src/main/scala/subsystem/BwReg
fi

cd "$BWREG_PATH"
git checkout $BWREG_BRANCH

cd $FIRESIM_ROOT/target-design/chipyard/generators/rocket-chip-inclusive-cache
git checkout $CACHE_BRANCH

cd $FIRESIM_ROOT
