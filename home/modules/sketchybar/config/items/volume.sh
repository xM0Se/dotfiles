#!/bin/bash

sketchybar \
    --add item volume right \
    --set volume \
    script="$PLUGIN_DIR/volume.sh" \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    padding_left=6 \
    padding_right=6 \
    icon.color=$TEXT \
    --subscribe volume volume_change
