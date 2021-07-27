#!/usr/bin/env bash

hc keybind XF86AudioRaiseVolume spawn amixer set Master 5+ unmute
hc keybind XF86AudioLowerVolume spawn amixer set Master 5- unmute
hc keybind XF86AudioMute spawn amixer -D pulse set Master 1+ toggle
