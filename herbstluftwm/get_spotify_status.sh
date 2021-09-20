#!/bin/bash

GetSpotifyStatus () {

    status=""

    if command -v spotifycli &> /dev/null
    then
        spotifycli_exist=1
    else 
        echo "--"
        exit
    fi

    if [ $spotifycli_exist -eq 1 ] 
    then
        #spotify_status="$(spotifycli --playbackstatus) $(spotifycli --statusshort)"
        spotify_status="$(spotifycli --statusshort)"
        echo "^bg()^fg() $spotify_status"
    fi
}

#echo $(GetSpotifyStatus)
