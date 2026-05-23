#!/bin/bash

sketchybar --add item clock.hh left \
    --set clock.hh \
    script="$PLUGIN_DIR/clock.sh" update_freq=30 \
    drawing=on icon.drawing=off label.drawing=on \
    label.font.size=30 label.color="$TEXT" \
    padding_left=0 padding_right=5 \
    y_offset=0

sketchybar --add item clock.mm left \
    --set clock.mm \
    script="$PLUGIN_DIR/clock.sh" update_freq=30 \
    drawing=on icon.drawing=off label.drawing=on \
    label.font.size=22 label.color="$TEXT" \
    padding_left=0 padding_right=10 \
    y_offset=0

sketchybar --add item clock.ap left \
    --set clock.ap \
    script="$PLUGIN_DIR/clock.sh" update_freq=30 \
    drawing=on icon.drawing=off label.drawing=on \
    label.font.size=12 label.color="$TEXT" \
    padding_left=0 padding_right=0 \
    y_offset=0

sketchybar --add bracket clock_group clock.hh clock.mm clock.ap \
    --set clock_group background.drawing=off
