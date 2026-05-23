#!/bin/bash
source "$CONFIG_DIR/colors.sh"

if /sbin/ping -c 1 -W 1 gogle.com &>/dev/null; then
    sketchybar --set wifi icon=􀙇 icon.color=$TEXT
else
    sketchybar --set wifi icon=􀙈 icon.color=$ACCENT_TEXT
fi
