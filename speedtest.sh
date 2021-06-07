#!/usr/bin/env bash
# use getevent -lt to find out x, y
source functions.sh
set -euo pipefail


# get service mode

unlock_phone
service_mode
speed_test
press_power

echo "Done"
