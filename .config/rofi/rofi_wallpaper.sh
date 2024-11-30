#!/bin/bash

search_dir=$HOME/wallpaper

options=""
for entry in "$search_dir"/*
do
  filename=$(basename "$entry")
  options+="$filename\n"
done

# Show the Rofi menu and get the selection
selection=$(echo -e "$options" | rofi -dmenu -theme $HOME/.cache/wal/colors-rofi-light.rasi -p "Select a background")

# get all wallpapers
monitors=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -n "$selection" ]; then
  background="$search_dir/$selection"
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$background"
  for monitor in $monitors; 
  do
    hyprctl hyprpaper wallpaper "$monitor,$background"
  done

  wal -a 92 -i "$background"
  "$HOME/.config/scripts/reload_theme.sh"
  "$HOME/.config/scripts/relaunch_waybar.sh"
else
  echo "No selection made."
  exit 1
fi
