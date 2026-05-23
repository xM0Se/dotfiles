#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon.drawing=on \
        icon.font="sketchybar-app-font:Regular:16.0" \
        label="$sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"

done
