#!/bin/bash

# Set wallpaper as background
background=$1
# wal -a 92 -i "$background" -n
:colorscheme colors

hellwal -i "$background" -m
# wal -i "$background" -q


ext="${background##*.}"

if [[ "${ext,,}" == "gif" ]]; then
  # run mpvpaper for GIFs
  pkill -x mpvpaper >/dev/null 2>&1 || true
  mpvpaper ALL "$background" --mpv-optionis -o "loop 0"
else
pkill -x mpvpaper >/dev/null 2>&1 || true
$HOME/.config/scripts/swww.sh "$background"
fi
$HOME/.config/scripts/launch_waybar.sh

# Obsidian
SASS_BIN=$(which sass)
$SASS_BIN "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.scss" \
          "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.css"

# NeoVim
fd "nvim\..*\.0" "$XDG_RUNTIME_DIR" | xargs -I {} nvim --server {} --remote-send ":colorscheme colors<CR>"

# PywalFox
pywalfox update

# Rofi
sass $HOME/.config/wofi/style.scss $HOME/.config/wofi/style.css

# Wlogout
sass $HOME/.config/wlogout/style.scss $HOME/.config/wlogout/style.css

# Terminal
source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh
xrdb -load ~/.Xresources
