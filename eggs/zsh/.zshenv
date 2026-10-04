typeset -U path PATH # prevent duplicate path

# general
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='moor'

# bob
. "/home/nnoel/.local/share/bob/env/env.sh"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH="$HOME/go/bin/:$PATH"

# rust
export PATH="$HOME/.cargo/bin/:$PATH"

for file in ~/.dotfiles/eggs/zsh/local.d/*.zsh(Nn); do
    source "$file"
done
