#!/bin/sh

selection=$(nsxiv -to ~/wallpaper/ | awk -F'/' '{print $NF}')
if [ -n "$selection" ]; then
  background="$HOME/wallpaper/$selection"
  $HOME/.config/scripts/change_theme_dwm.sh "$background"
else
  echo "No selection made."
  exit 1
fi
