#!/bin/sh
source "$CONFIG_DIR/colors.sh"

case "$NAME" in
clock.hh) sketchybar --set "$NAME" label="$(date '+%I')" ;; # hours
clock.mm) sketchybar --set "$NAME" label="$(date '+%M')" ;; # minutes
clock.ap) sketchybar --set "$NAME" label="$(date '+%p')" ;; # am/pm
esac
