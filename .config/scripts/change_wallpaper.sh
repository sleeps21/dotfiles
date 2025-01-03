
#!/bin/bash
# dmenu
# search_dir=$HOME/wallpaper

# options=""
# for entry in "$search_dir"/*
# do
#   filename=$(basename "$entry")
#   options+="$filename\n"
# done

# # Show the Rofi menu and get the selection
# selection=$(echo -e "$options" | wofi -dmenu -theme $HOME/.cache/wal/colors-rofi-light.rasi -p "Select a background")

selection=$(sxiv -to ~/wallpaper/ | awk -F'/' '{print $NF}')

# get all wallpapers
monitors=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -n "$selection" ]; then
  background="$HOME/wallpaper/$selection"
  $HOME/.config/scripts/change_themes.sh $background
else
  echo "No selection made."
  exit 1
fi
