#!/bin/bash

sketchybar -m --add item vpn right \
    --set vpn update_freq=5 \
    icon.font.size=18 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    padding_left=6 \
    padding_right=6 \
    --set vpn script="$PLUGIN_DIR/vpn.sh"
