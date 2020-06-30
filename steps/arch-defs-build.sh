#!/bin/bash

export CMAKE_FLAGS="-GNinja -DVPR_CAPNP_SCHEMA_DIR=$VTR_ROOT/libs/libvtrcapnproto/gen/"
make env
