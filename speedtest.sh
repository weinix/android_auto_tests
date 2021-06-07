#!/usr/bin/env bash
# use getevent -lt to find out x, y
source functions.sh
set -euo pipefail

MAX_WAIT=60

# get service mode

unlock_phone

service_mode

filename=$(date "+svcmode_%Y%m%d-%H%M.png")
adb exec-out screencap -p > $filename

./img2txt.py $filename | grep .

#Start speed test
adb shell monkey -p org.zwanoo.android.speedtest 1 2>&1 > /dev/null
sleep 5

#Tap go button
adb shell input tap 516 947
sleep $MAX_WAIT

filename=$(date "+speedtest_%Y%m%d-%H%M.png")
adb exec-out screencap -p > $filename

#Tap share button
adb shell input tap 1001 128
sleep 3


# tap gmail
adb shell input tap 132 2060
sleep 1

adb shell input text "wei.w.wang@gmail.com"
sleep 1

adb shell input keyevent 66
sleep 1

adb shell input tap 881 137
sleep 1

adb shell input tap 70 105
sleep 2

adb shell am force-stop org.zwanoo.android.speedtest

echo "Done"
