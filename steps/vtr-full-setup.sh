#!/bin/bash

./vtr_flow/scripts/download_titan.py --vtr_flow_dir ./vtr_flow --mirror google || make get_titan_benchmarks

dev/upgrade_vtr_archs.sh
