#!/bin/bash

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
