typeset -U path PATH # prevent duplicate path

# general
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='moor'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH="$HOME/go/bin/:$PATH"

# rust
. "$HOME/.cargo/env"

# bob
. "/home/nnoel/.local/share/bob/env/env.sh"
