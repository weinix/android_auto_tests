##!/usr/bin/env bash
#set -euo pipefail
#
unlock_phone()
{
   adb shell input keyevent 26
   adb shell input keyevent 82
   sleep .3
   adb shell input text 789329
   adb shell input keyevent 66
}


# get service mode

# HOme
press_home()
{
  adb shell input tap 500 2356
  sleep .1
}

#Phone
press_phone()
{
  adb shell input tap 139 2123
  sleep .1
}

#Press *
press_star()
{
  adb shell input tap 255 1701
  sleep .1
}

#Press #
press_pound()
{
  adb shell input tap 819 1635
  sleep .1
}

#Press 0
press_0()
{
  adb shell input tap 554 1696
  sleep .1
}

#Press 1
press_1()
{
  adb shell input tap 188 1031
  sleep .1
}

press_2()
{
  adb shell input tap 519 999
  sleep .1
}

press_3()
{
  adb shell input tap 832 1024
  sleep .1
}

press_4()
{
  adb shell input tap 250 1251
  sleep .1
}

press_5()
{
  adb shell input tap 548 1257
  sleep .1
}

press_6()
{
  adb shell input tap 823 1237
  sleep .1
}

press_7()
{
  adb shell input tap 239 1455
  sleep .1
}

press_8()
{
  adb shell input tap 556 1465
  sleep .1
}

press_9()
{
  adb shell input tap 878 1445
  sleep .1
}

service_mode()
{
    press_home
    press_phone
    press_star
    press_pound
    press_0
    press_0
    press_1
    press_1
    press_pound
}
