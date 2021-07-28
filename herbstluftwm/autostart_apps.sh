#!/bin/bash

if hc silent new_attr bool my_not_first_autostart ; then
    $HOME/.config/herbstluftwm/exec_on_tag.sh 1-web google-chrome &
    $HOME/.config/herbstluftwm/exec_on_tag.sh 9-spotify spotify 
fi
