#!/bin/sh

# Fix for local environment at ND: unset PYTHONPATH to ignore existing python installs.
export PYTHONPATH=

# Activate the Conda shell hooks without starting a new shell.
CONDA_BASE=$(conda info --base)
. $CONDA_BASE/etc/profile.d/conda.sh

# Create and install a new environment.
conda create -y --name cctools-test -c conda-forge --strict-channel-priority python=3.9 ndcctools
conda activate cctools-test

# After install, run some basic commands.
exec ./smoke.sh
