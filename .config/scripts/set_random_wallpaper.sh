#!/bin/bash


directory=$HOME/wallpaper
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')
echo "$monitor"

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.{jpg,png} | shuf -n 1)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background
    for monitor in $monitors;
      do
        hyprctl hyprpaper wallpaper "$monitor,$random_background"
      done
fi
wal -a 92 -i "$random_background" -n

$HOME/.config/scripts/launch_waybar.sh
  $HOME/.config/scripts/change_ob_theme.sh
fd "nvim\..*\.0" "$XDG_RUNTIME_DIR" | xargs -I {} nvim --server {} --remote-send ":colorscheme colors<CR>"
pywalfox update
$HOME/.config/scripts/change_rofi_theme.sh
$HOME/.config/scripts/change_wlogout_theme.sh
