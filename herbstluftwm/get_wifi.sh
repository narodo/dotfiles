#!/bin/bash

GetWifi () {


    wifi_signal=$(nmcli dev wifi list | awk '/\*/{if (NR!=1) {print $8}}')

    if [ "$wifi_signal" == "" ]; then
        wifi_signal="nc"
        wifi_color="^fg(#b10e03)"
    else 
        if [ "${wifi_signal}" -lt "75" ]; then
            wifi_color="^fg(#cfc64e)"
        else
            wifi_color="^fg(#8cb11e)"
        fi
    fi

    wifi="^bg()^fg()Wifi: $wifi_color$wifi_signal"
    echo $wifi

}

#GetWifi
