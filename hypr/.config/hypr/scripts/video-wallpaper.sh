#!/usr/bin/env bash

VIDEOS_DIR="$HOME/Videos/wallpapers"
PID_FILE="/tmp/hyprpaper-video.pid"

stop_video() {
    if [ -f "$PID_FILE" ]; then
        kill $(cat "$PID_FILE") 2>/dev/null
        rm "$PID_FILE"
    fi
    pkill -f "mpv.*wallpaper"
}

toggle_video() {
    if pgrep -f "mpv.*wallpaper" > /dev/null; then
        stop_video
    else
        local video=$(ls "$VIDEOS_DIR"/*.mp4 2>/dev/null | shuf -n1)
        if [ -n "$video" ]; then
            mpv --loop --no-audio \
                --fullscreen \
                --screen=0 \
                --on-all-workspaces=yes \
                --geometry=0:0 \
                --border=no \
                --title="video-wallpaper" \
                --keep-open=no \
                "$video" >/dev/null 2>&1 &
            echo $! > "$PID_FILE"
        fi
    fi
}

case "$1" in
    stop) stop_video ;;
    toggle) toggle_video ;;
    *) toggle_video ;;
esac