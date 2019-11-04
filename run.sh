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

# Build VtR
source $SCRIPT_DIR/steps/vtr-build.sh
# Run the reg test.
source $SCRIPT_DIR/steps/vtr-test.sh
