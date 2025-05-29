#!/bin/bash

label=$(
  osascript <<-APPLESCRIPT
  tell application "System Events"
    activate
    set theDialog to display dialog "Enter new label:" default answer ""
    text returned of theDialog
  end tell
APPLESCRIPT
)

sketchybar --set write_text label="$label"
