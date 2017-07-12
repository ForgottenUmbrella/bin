#!/bin/bash

STEP="5"

[[ "$1" == "up" ]] && xbacklight -inc $STEP
[[ "$1" == "down" ]] && xbacklight -dec $STEP

volnoti-show -s "/usr/share/pixmaps/volnoti/display-brightness-symbolic.svg" $(xbacklight -get)

