alias sudo="sudo "

# general
alias cd="z" # zoxide
alias lg="lazygit"
alias vim="nvim"
alias zsh-reload='source ~/.zshrc'

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
alias ygl="yolk git log --graph"
alias yglp="yolk git log --stat --patch --graph"
alias yglo="yolk git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short"
alias yga="yolk git add"
alias ygaa="yolk git add -A"
alias ygr="yolk git restore"
alias ygrs="yolk git restore --staged"
alias ygc="yolk git commit --verbose"
alias ygP="yolk git push"
alias ygf="yolk git fetch"
alias ygp="yolk git pull"
alias ygd="yolk git diff"
