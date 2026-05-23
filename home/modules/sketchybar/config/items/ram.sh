#!/bin/bash

sketchybar --add item ram right \
    --set ram \
    script="$PLUGIN_DIR/ram.sh" \
    update_freq=5 \
    icon="􀫦" \
    icon.font.size=15 \
    icon.color="$TEXT" \
    label="--%" \
    label.font="JetBrains Mono:Semibold:15.0" \
    label.font.size=11 \
    label.color="$TEXT" \
    padding_left=6 \
    padding_right=6 \
    background.drawing=off
