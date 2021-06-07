##!/usr/bin/env bash
#set -euo pipefail
#



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

press_keypad()
{
  adb shell input tap 196 2193
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

is_screen_on()
{
  adb shell dumpsys vr | awk -F'=' '/mScreenOn/{print $2}'
}


service_mode()
{
  press_home
  press_phone
  press_keypad
  press_star
  press_pound
  press_0
  press_0
  press_1
  press_1
  press_pound

  filename=$(date "+svcmode_%Y%m%d-%H%M.png")
  adb exec-out screencap -p > ./results/${filename}
  
  ./img2txt.py ./results/${filename} | grep .
}

press_power()
{
   adb shell input keyevent 26
}

press_enter()
{
   adb shell input keyevent 66
   sleep .1
}

press_menu()
{
   adb shell input keyevent 82
   sleep .1
}

swipe_up()
{
  adb shell input swipe 300 300 500 1000 
}

swipe_down()
{
  adb shell input swipe 500 1000 300 300 
}

unlock_phone()
{
  # press power button
  if [[ "$(is_screen_on)" == "false" ]] ; then
    press_power
  fi
  swipe_up
  adb shell input text 789329
  press_enter
}

speed_test()
{
  #Start speed test
  adb shell monkey -p org.zwanoo.android.speedtest 1 > /dev/null 2>&1
  sleep 5
  
  #Tap go button
  adb shell input tap 516 947
  sleep $MAX_WAIT
  
  filename=$(date "+speedtest_%Y%m%d-%H%M.png")
  adb exec-out screencap -p > ./results/${filename}
  
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

}
