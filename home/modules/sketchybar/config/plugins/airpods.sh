#!/bin/bash
source "$CONFIG_DIR/colors.sh"

CASE=$(/usr/sbin/system_profiler SPBluetoothDataType | /run/current-system/sw/bin/rg -A6 "Moritz’s AirPods:" | tail -n +5 | head -n 1 | /run/current-system/sw/bin/rg -o '\d+')

LEFT=$(/usr/sbin/system_profiler SPBluetoothDataType | /run/current-system/sw/bin/rg -A6 "Moritz’s AirPods:" | tail -n +6 | head -n 1 | /run/current-system/sw/bin/rg -o '\d+')

RIGHT=$(/usr/sbin/system_profiler SPBluetoothDataType | /run/current-system/sw/bin/rg -A6 "Moritz’s AirPods:" | tail -n +7 | head -n 1 | /run/current-system/sw/bin/rg -o '\d+')

if [ $CASE -lt 10 ]; then
    sketchybar -m --set casep label="${CASE}%" label.color=$ACCENT_TEXT
    sketchybar -m --set casei label.color=$ACCENT_TEXT
elif [ $CASE -gt 100 ]; then
    sketchybar -m --set casep label="100%" label.color=$TEXT
    sketchybar -m --set casei label.color=$TEXT
else
    sketchybar -m --set casep label="${CASE}%" label.color=$TEXT
    sketchybar -m --set casei label.color=$TEXT
fi

if [ $LEFT -lt 10 ]; then
    sketchybar -m --set lpodp label="${LEFT}%" label.color=$ACCENT_TEXT
    sketchybar -m --set lpodi label.color=$ACCENT_TEXT
elif [ $LEFT -gt 100 ]; then
    sketchybar -m --set lpodp label="100%" label.color=$TEXT
    sketchybar -m --set lpodi label.color=$TEXT
else
    sketchybar -m --set lpodp label="${LEFT}%" label.color=$TEXT
    sketchybar -m --set lpodi label.color=$TEXT
fi

if [ $RIGHT -lt 10 ]; then
    sketchybar -m --set rpodp label="${RIGHT}%" label.color=$ACCENT_TEXT
    sketchybar -m --set rpodi label.color=$ACCENT_TEXT
elif [ $RIGHT -gt 100 ]; then
    sketchybar -m --set rpodp label="100%" label.color=$TEXT
    sketchybar -m --set rpodi label.color=$TEXT
else
    sketchybar -m --set rpodp label="${RIGHT}%" label.color=$TEXT
    sketchybar -m --set rpodi label.color=$TEXT
fi
