export PATH="$HOME/.fly/bin:$PATH"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "$HOME/.config/shell/profile"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins

# Load completions
autoload -Uz compinit && compinit

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp-config.toml)"
# Keybindings
bindkey "^f" autosuggest-accept

# History
HISTSIZE=5000
HISTFILE=$HISTFILE
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Man pages
export MANPAGER="nvim +Man!"

# Completion styling


# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias e='exit'
alias python='python3'
alias pip='pip3'
alias sshpi='TERM=xterm-256color ssh sleeps-pi@192.168.178.7'

# Truecolor
export COLORTERM=truecolor
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "di=69:ln=69:ex=69"
zstyle ':completion:*' menu no

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions


# Hellwal
source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh
# Styles map
# typeset -gA ZSH_HIGHLIGHT_STYLES

# Use hex from wal

# # source pywal colors
# . "${HOME}/.cache/wal/colors.sh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${foreground}"  # try color8 or color7 with lower contrast
ZSH_HIGHLIGHT_STYLES[default]="fg=${color3}"
ZSH_HIGHLIGHT_STYLES[comment]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[command]="fg=${color4}"
# ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${color1},bold"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#ff0000,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=${color5}"
ZSH_HIGHLIGHT_STYLES[reserved]="fg=${color5}"
ZSH_HIGHLIGHT_STYLES[alias]="fg=${color6}"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=${color6}"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=${color6}"
ZSH_HIGHLIGHT_STYLES[function]="fg=${color3},bold"
ZSH_HIGHLIGHT_STYLES[command-substitution]="fg=${color4}"
ZSH_HIGHLIGHT_STYLES[quote]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=${color3},bold"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=${color2}"
ZSH_HIGHLIGHT_STYLES[path]="fg=${color6},underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=${color3}"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=${color1},bold"
ZSH_HIGHLIGHT_STYLES[foreign-command]="fg=${color4},bold"


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/sleeps/.dart-cli-completion/zsh-config.zsh ]] && . /home/sleeps/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

