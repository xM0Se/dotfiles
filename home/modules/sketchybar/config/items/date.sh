#!/bin/bash

sketchybar \
    --add item day left \
    --set day \
    update_freq=120 \
    icon.drawing=off \
    padding_right=4 \
    label="$(date '+%a')" \
    label.color="$TEXT"

sketchybar \
    --add item date left \
    --set date \
    update_freq=120 \
    icon.drawing=off \
    padding_right=4 \
    label="$(date '+%d' | sed 's/^0//')" \
    label.color="$TEXT"

sketchybar \
    --add item month left \
    --set month \
    update_freq=120 \
    icon.drawing=off \
    padding_right=4 \
    label="$(date '+%b')" \
    label.color="$TEXT"
