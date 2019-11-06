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

(
	cd $VTR_DIR
	source $SCRIPT_DIR/steps/git.sh
	# Build VtR
	source $SCRIPT_DIR/steps/vtr-build.sh
	ls -l
)

export VPR=$(realpath $PWD/$VTR_DIR/vpr/vpr)
$VPR --version

# Run the reg test.
(
	cd $ARCH_DEFS_DIR
	source $SCRIPT_DIR/steps/git.sh
	# Build SymbiFlow Arch Defs environment
	source $SCRIPT_DIR/steps/arch-defs-build.sh
	# Run the SymbiFlow Arch Defs test
	source $SCRIPT_DIR/steps/arch-defs-test.sh
)
