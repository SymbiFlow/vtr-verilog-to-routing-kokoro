#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $SCRIPT_DIR/travis.sh

set -x
set -e

ls -l
cd github
ls -l
cd vtr-verilog-to-routing-continuous

echo "--------------------------------------"
git status
echo "--------------------------------------"
git log -n1
echo "--------------------------------------"

./.github/travis/build.sh
./run_reg_test.pl $VTR_TEST -show_failures -j$NUM_CORES
