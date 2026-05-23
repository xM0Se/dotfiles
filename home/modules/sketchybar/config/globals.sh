#!/bin/bash

export SB_BAR=(
    position=left
    height=60
    sticky=on
    topmost=off
    shadow=on
    y_offset=10
    margin=10
    padding_left=10
    padding_right=10
    color="$BAR_COLOR"
    border_color="$HIGHLIGHT_HIGH"
    border_width=1
    corner_radius=12
    font_smoothing=on
    blur_radius=30
)

export SB_DEFAULT=(
    icon.font.family="SF Pro:Semibold:15.0"
    icon.font.style="Regular"
    icon.font.size=13
    icon.color="$TEXT"
    label.font="JetBrains Mono:Semibold:15.0"
    label.font.style="Regular"
    label.font.size=13
    label.color="$TEXT"
    padding_left=10
    padding_right=10
    icon.padding_right=4
)
