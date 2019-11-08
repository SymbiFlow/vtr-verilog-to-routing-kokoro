#!/bin/bash

export ARCH_DEFS_TEST=${ARCH_DEFS_TEST:-all_demos}
export VPR_NUM_WORKERS=${CORES}
export NUM_JOBS=${NUM_CORES:-${MAX_CORES}}

echo "========================================"
echo "Testing symbiflow-arch-defs"
echo "----------------------------------------"
echo ""
echo "ARCH_DEFS_TEST=${ARCH_DEFS_TEST}"
echo "VPR_NUM_WORKERS=${VPR_NUM_WORKERS}"
echo "NUM_JOBS=${NUM_JOBS}"

echo ""
echo "========================================"
echo "Preparing to build conda environment"
echo "----------------------------------------"
date
echo ""
ninja all_conda

echo ""
echo "========================================"
echo "Running tests"
echo "----------------------------------------"
ninja -j${NUM_JOBS} ${ARCH_DEFS_TEST}

echo ""
echo "========================================"
echo "Getting QOR"
echo "----------------------------------------"
ninja print_qor > all_qor.csv

echo ""
echo "========================================"
echo "Done running tests, cleaning up build directory"
echo "----------------------------------------"
cd ..
source .github/kokoro/package_results.sh