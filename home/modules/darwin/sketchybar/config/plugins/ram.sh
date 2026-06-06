#!/bin/bash

ram_usage=$(/usr/bin/memory_pressure | /usr/bin/grep "System-wide memory free percentage:" | /usr/bin/awk '{ printf("%02.0f\n", 100-$5"%") }')

sketchybar -m --set ram label="${ram_usage}%"
