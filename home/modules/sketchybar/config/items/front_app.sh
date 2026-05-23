#!/bin/bash

sketchybar \
    --add item front_app left \
    --set front_app \
    script="$PLUGIN_DIR/front_app.sh" \
    icon.drawing=on \
    icon.color=$OPEN_SPACE_COLOR \
    icon.font="sketchybar-app-font:Regular:16.0" \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    padding_left=6 \
    padding_right=6 \
    drawing=on \
    --subscribe front_app front_app_switched window_change
