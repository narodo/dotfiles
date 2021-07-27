#!/bin/bash

GetBattery () {

    out_string=""

    batteries=( $(upower -e | grep BAT) )
    for bat in "${batteries[@]}"
    do
        name=$(upower -i $bat | grep native-path | cut -d ":" -f2 )
        percent=$(upower -i $bat | grep percentage | grep -oE '[0-9]{1,3}')
        discharging=$(upower -i $bat | grep state | grep -oE 'discharging')

        if [ "${percent}" -lt "15" ]; then
            battery_color="^fg(#b10e03)"
        else
            battery_color="^fg()"
        fi
        if [ "$discharging" == "" ]; then
            battery_color="^fg(#8cb11e)"
        fi
        #battery="$name:$percent"
        battery="^bg()^fg()$name: $battery_color$percent"
        out_string=$out_string$battery
    done

    echo $out_string
}

#echo $(GetBattery)
