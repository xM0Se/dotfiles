#!/bin/bash

sketchybar --add item calendar right \
  --set calendar icon= \
  update_freq=1 \
  background.color="$BAR_COLOR" \
  script="$PLUGIN_DIR/calendar.sh"
