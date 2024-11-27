#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch polybar
echo "---" | tee -a /tmp/mainbar.log
polybar mainbar 2>&1 | tee -a /tmp/mainbar.log & disown

echo "Main Bar launched..."
