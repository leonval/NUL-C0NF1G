# load completion system
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

[ -s "/home/nnoel/.bun/_bun" ] && source "/home/nnoel/.bun/_bun" # bun completions
