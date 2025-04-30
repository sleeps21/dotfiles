selection=$(sxiv -to ~/wallpaper/ | awk -F'/' '{print $NF}')

# get all wallpapers
monitors=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -n "$selection" ]; then
  background="$HOME/wallpaper/$selection"
  feh --bg-scale $background
  wal -a 92 -i "$background" -n
  hellwal -i "$background" -q

  # Obsidian
  SASS_BIN=$(which sass)  # Ensure the sass binary is correctly located
  $SASS_BIN "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.scss" \
            "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.css"

  # NeoVim
  fd "nvim\..*\.0" "$XDG_RUNTIME_DIR" | xargs -I {} nvim --server {} --remote-send ":colorscheme colors<CR>"

  # PywalFox
  pywalfox update
else
  echo "No selection made."
  exit 1
fi
