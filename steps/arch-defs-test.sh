#!/bin/bash

export ARCH_DEFS_TEST=${ARCH_DEFS_TEST:-all_demos}
export VPR_NUM_WORKERS=${CORES}
export NUM_JOBS=${NUM_CORES:-${MAX_CORES}}

echo "ARCH_DEFS_TEST=${ARCH_DEFS_TEST}"
echo "VPR_NUM_WORKERS=${VPR_NUM_WORKERS}"
echo "NUM_JOBS=${NUM_JOBS}"

ninja all_conda
ninja -j${NUM_JOBS} ${ARCH_DEFS_TEST}
ninja print_qor > all_qor.csv
