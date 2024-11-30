
#!/bin/bash

# Full path to sass
SASS_BIN=$(which sass)  # Ensure the sass binary is correctly located

# Run sass with full paths
$SASS_BIN "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.scss" \
          "$HOME/Obsidian/sleeps/.obsidian/themes/pywal_theme/theme.css"
