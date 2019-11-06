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
	cd $KOKORO_DIR
	source $SCRIPT_DIR/steps/git.sh
	# Build VtR
	source $SCRIPT_DIR/steps/vtr-build.sh
)

export VTR=$(realpath $PWD/$KOKORO_DIR/bin/vtr)
$VTR --version

# Run the reg test.
(
	cd *_symbiflow-arch-defs
	source $SCRIPT_DIR/steps/git.sh
	# Build SymbiFlow Arch Defs environment
	source $SCRIPT_DIR/steps/arch-defs-build.sh
	# Run the SymbiFlow Arch Defs test
	source $SCRIPT_DIR/steps/arch-defs-test.sh
)
