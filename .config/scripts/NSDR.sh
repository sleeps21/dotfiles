#!/bin/bash

# Kill waybar
killall waybar

# Get the list of monitors
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')

# Set random background
background="$HOME/wallpaper/black.jpg"
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$background"

for monitor in $monitors; do
  hyprctl hyprpaper wallpaper "$monitor,$background"
done

# Play MP3 with VLC and schedule shutdown
audio_file="$HOME/Music/nsdr/nsdr20min_huberman.mp3"
# Schedule shutdown after the duration of the MP3
shutdown 21
# Start VLC
mpv --no-terminal --quiet --ontop --no-resume-playback --loop-file=no --player-operation-mode=pseudo-gui "$audio_file"


