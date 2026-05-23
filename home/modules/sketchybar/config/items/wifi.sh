#!/bin/bash

sketchybar -m --add item wifi right \
    --set wifi update_freq=5 \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    padding_left=6 \
    padding_right=6 \
    script="$PLUGIN_DIR/wifi.sh"
