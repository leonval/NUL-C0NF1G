# load completion system
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select # Enable interactive completion menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Make completion case-insensitive

[ -s "/home/nnoel/.bun/_bun" ] && source "/home/nnoel/.bun/_bun" # bun completions
