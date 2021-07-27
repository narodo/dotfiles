#!/usr/bin/env bash

GetVolume () {

    out_string=""
    volume_on=$(amixer sget Master | grep -oE '\[on\]')
    if [ "$volume_on" == "" ]; then
        volume_level="^fg(#909090)off"
    else
        volume_level=$(amixer -D pulse get Master | grep -oE 'Front Left:.*' | grep -oE '[0-9]{1,3}%')
    fi
    volume="^bg()^fg()Volume: $volume_level"
    echo $volume

}

#echo $(GetVolume)
