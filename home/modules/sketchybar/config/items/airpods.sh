#!/bin/bash

#_______________ airpod case _______________

sketchybar -m \
    --add item casep right \
    --set casep update_freq=10 \
    label="--%" \
    label.font.size=11 \
    label.color="$TEXT" \
    padding_left=6 \
    padding_right=6 \
    --set casep script="$PLUGIN_DIR/airpods.sh"

sketchybar -m \
    --add item casei right \
    --set casei \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    padding_left=6 \
    padding_right=6 \
    icon="􂭇" \
    icon.color=$TEXT

#_______________ left airpod _______________

sketchybar -m \
    --add item lpodp right \
    --set casep update_freq=10 \
    label="--%" \
    label.font.size=11 \
    label.color="$TEXT" \
    padding_left=6 \
    padding_right=6 \
    --set lpodp script="$PLUGIN_DIR/airpods.sh"

sketchybar -m \
    --add item lpodi right \
    --set lpodi \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    padding_left=6 \
    padding_right=6 \
    icon="􂭄" \
    icon.color=$TEXT

#_______________ right airpod _______________

sketchybar -m \
    --add item rpodp right \
    --set casep update_freq=10 \
    label="--%" \
    label.font.size=11 \
    label.color="$TEXT" \
    padding_left=6 \
    padding_right=6 \
    --set rpodp script="$PLUGIN_DIR/airpods.sh"

sketchybar -m \
    --add item rpodi right \
    --set rpodi \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    padding_left=6 \
    padding_right=6 \
    icon="􂭅" \
    icon.color=$TEXT
