alias sudo="sudo "

alias cd="z" # zoxide
alias cat="bat --theme Dracula"
alias lg="lazygit"
alias vim="nvim"

# bat
alias b="bat"
alias bn="bat --number"
alias bnl="bat --number --line-range"
alias bp="bat --plain"
alias bpl="bat --plain --line-range"
alias bl="bat --line-range"

# eza 
alias x="eza --icons"
alias xa="eza --icons --all"
alias xl="eza --icons --long"
alias xla="eza --icons --long --all"
alias xt="eza --icons --tree"
alias xta="eza --icons --tree --all"

# yolk dotfiles
alias ygs="yolk git status --short --branch"
alias ygst="yolk git status"
alias ygl="yolk git log"
alias ygaa="yolk git add -A"
alias ygc="yolk git commit --verbose"
alias ygP="yolk git push"
alias ygf="yolk git fetch"
alias ygp="yolk git pull"
alias ygd="yolk git diff"

# laravel sail alias
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
