
#!/bin/bash

search_dir=$HOME/wallpaper

options=""
for entry in "$search_dir"/*
do
  filename=$(basename "$entry")
  options+="$filename\n"
done
echo "$filename"
echo "$options"

# Show the Rofi menu and get the selection
selection=$(echo -e "$options" | wofi -dmenu -theme $HOME/.cache/wal/colors-rofi-light.rasi -p "Select a background")
echo "$selection"
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

  wal -a 92 -i "$background" -n
  $HOME/.config/scripts/launch_waybar.sh
  $HOME/.config/scripts/change_ob_theme.sh
  fd "nvim\..*\.0" "$XDG_RUNTIME_DIR" | xargs -I {} nvim --server {} --remote-send ":colorscheme colors<CR>"
  pywalfox update
  $HOME/.config/scripts/change_rofi_theme.sh
  $HOME/.config/scripts/change_wlogout_theme.sh
else
  echo "No selection made."
  exit 1
fi
