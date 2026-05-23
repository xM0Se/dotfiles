#!/bin/bash

sketchybar -m --add item mic right \
    --set mic update_freq=3 \
    --set mic script="~/.config/sketchybar/plugins/mic.sh" \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    padding_left=6 \
    padding_right=6 \
    --subscribe mic volume_change
