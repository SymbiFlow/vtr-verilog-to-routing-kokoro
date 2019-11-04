#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

set -x
set -e

# Set up the host
source $SCRIPT_DIR/steps/hostsetup.sh
source $SCRIPT_DIR/steps/hostinfo.sh

# Output git information
ls -l
cd github
ls -l
cd vtr-verilog-to-routing-continuous
source $SCRIPT_DIR/steps/git.sh

# Travis compatibility script
source $SCRIPT_DIR/travis.sh
./.github/travis/build.sh
./run_reg_test.pl $VTR_TEST -show_failures -j$NUM_CORES
