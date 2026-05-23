#!/bin/bash
source "$CONFIG_DIR/colors.sh"

VPN_STATUS1=$(/usr/local/bin/mullvad status | head -n 1)
VPN_STATUS2=$(/usr/sbin/networksetup -showpppoestatus "Twingate" | head -n 2)

if [[ $VPN_STATUS1 == Connected ]]; then
    sketchybar -m --set vpn icon=􀙨 icon.color=$TEXT
elif [[ $VPN_STATUS2 == connected ]]; then
    sketchybar -m --set vpn icon=􀒞 icon.color=$TEXT
else
    sketchybar -m --set vpn icon=􀲊 icon.color=$ACCENT_TEXT
fi
