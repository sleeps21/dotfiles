#!/bin/sh

background=$1
feh --bg-scale "$background"
# wal -a 92 -i "$background" -n
hellwal -i "$background" -q -d

# Xresources
xrdb -merge "$HOME/.cache/hellwal/colors.xresources"
xrdb -merge "$HOME/.Xresources"
pkill -HUP dwm

# Obsidian
SASS_BIN=$(which sass)
$SASS_BIN "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.scss" \
    "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.css"

# Rofi
sass $HOME/.config/wofi/style.scss $HOME/.config/wofi/style.css

# NeoVim
fd "nvim\..*\.0" "$XDG_RUNTIME_DIR" | xargs -I {} nvim --server {} --remote-send ":colorscheme colors<CR>"

