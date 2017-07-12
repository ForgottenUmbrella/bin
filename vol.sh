#!/bin/bash

STEP="5"
SETVOL="amixer -q -D pulse set Master"

[[ "$1" == "up" ]] && $SETVOL $STEP%+ unmute
[[ "$1" == "down" ]] && $SETVOL $STEP%- unmute
[[ "$1" == "mute" ]] && $SETVOL toggle

pkill -RTMIN+10 i3blocks

VOL=$(amixer get Master | grep -Po "[0-9]+(?=%)" | head -1)
[[ $(amixer get Master | grep "\[off\]") ]] && volnoti-show -m $VOL && exit
volnoti-show $VOL
paplay /usr/share/sounds/gnome/default/alerts/drip.ogg --volume=32768
