#!/usr/bin/env bash

PID_FILE="/tmp/nwg-dock.pid"

if pgrep -f "nwg-dock-hyprland" > /dev/null; then
    pkill -f "nwg-dock-hyprland"
    echo "Dock hidden"
else
    nohup nwg-dock-hyprland -i 32 -w 5 -mb 10 -x -s themes/glass/style.css -c ~/.config/hypr/scripts/launcher.sh >/dev/null 2>&1 &
    echo "Dock shown"
fi