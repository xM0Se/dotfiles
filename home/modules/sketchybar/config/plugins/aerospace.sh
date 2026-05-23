#!/bin/bash
source "$CONFIG_DIR/colors.sh"

sid="$1"

win_count=$(aerospace list-windows --workspace "$sid" 2>/dev/null | wc -l | tr -d ' ')

if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
    LABEL_COLOR="$OPEN_SPACE_COLOR"
else
    LABEL_COLOR="$TEXT"
fi

if [ "$sid" = "$FOCUSED_WORKSPACE" ] || [ "$win_count" -gt 0 ]; then

    sketchybar --set "$NAME" \
        label="$sid" \
        label.color="$LABEL_COLOR" \
        label.font.size=15 \
        label.align=center \
        icon.drawing=off \
        background.drawing=off \
        drawing=on

else

    sketchybar --set "$NAME" drawing=off

fi
