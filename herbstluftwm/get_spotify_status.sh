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

        spotify_playback_status="$(spotifycli --playbackstatus)"

        # something funky going on when using the unicode character
        if [ $spotify_playback_status = "▮▮" ] 
        then
            playchar="||"
        else
            playchar=">"
        fi

        spotify_song="$(spotifycli --statusshort)"
        spotify_status="$playchar-$spotify_song"
        #spotify_status="$(spotifycli --statusshort)"
        echo "^bg()^fg() $spotify_status"
    fi
}

#echo $(GetSpotifyStatus)
