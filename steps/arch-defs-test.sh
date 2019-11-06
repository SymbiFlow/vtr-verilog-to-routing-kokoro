#!/bin/bash

if [ z$ARCH_DEFS_TEST == z ]; then
	export ARCH_DEFS_TEST=all_demos
fi
make $ARCH_DEFS_TEST
