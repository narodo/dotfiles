#!/bin/bash

max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
cur_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

set_brightness() (

    if [ $1 -gt $max_brightness ]
    then
        brightness=$max_brightness
    else
        brightness=$1
    fi

    echo $brightness | sudo tee /sys/class/backlight/intel_backlight/brightness
)


if [ -z $1 ]
then
    echo "No brightness specified [max: $max_brightness]"
    exit
fi


if [ "$1" = "max" ]
then
    set_brightness $max_brightness
    exit
fi

if [ "$1" = "inc" ]
then
    new_brightness=$(($cur_brightness+100))
    set_brightness $new_brightness
    exit
fi

if [ "$1" = "dec" ]
then
    new_brightness=$(($cur_brightness-100))
    set_brightness $new_brightness
    exit
fi



