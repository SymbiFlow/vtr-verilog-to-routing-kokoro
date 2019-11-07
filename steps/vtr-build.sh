#!/bin/bash

export FAILURE=0
make -k -j$MAX_CORES || export FAILURE=1

echo
echo
echo
echo

# When the build fails, produce the failure output in a clear way
if [ $FAILURE -ne 0 ]; then
        make -j1
        exit 1
fi
