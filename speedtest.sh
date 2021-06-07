#!/usr/bin/env bash
# use getevent -lt to find out x, y
source functions.sh
set -euo pipefail

MAX_WAIT=60

# get service mode

unlock_phone

service_mode

filename=$(date "+svcmode_%Y%m%d-%H%M.png")
adb exec-out screencap -p > ./results/${filename}

./img2txt.py ./results/${filename} | grep .

speed_test

press_power

echo "Done"
