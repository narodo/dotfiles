#!/usr/bin/env bash

hc keybind XF86AudioRaiseVolume spawn amixer set Master 5+ unmute
hc keybind XF86AudioLowerVolume spawn amixer set Master 5- unmute
hc keybind XF86AudioMute spawn amixer -D pulse set Master 1+ toggle

# spotify bindings
if command -v spotifycli &> /dev/null
then
    hc keybind XF86AudioPlay spawn spotifycli --playpause
    hc keybind XF86AudioNext spawn spotifycli --next
    hc keybind XF86AudioPrev spawn spotifycli --prev
fi
