#!/bin/bash

# Set wallpaper as background
background=$1
# wal -a 92 -i "$background" -n
hellwal -i "$background" -q --check-contrast
wal -i "$background" -q
# hellwal --theme ./themes/gruvbox.hellwal
$HOME/.config/scripts/swww.sh "$background"
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
