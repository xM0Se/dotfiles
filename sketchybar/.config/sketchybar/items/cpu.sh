#!/bin/bash

sketchybar --add item cpu right \
  --set cpu update_freq=1 \
  icon=􀫥 \
  label.color=$BAR_COLOR \
  icon.color=$BAR_COLOR \
  script="$PLUGIN_DIR/cpu.sh"
