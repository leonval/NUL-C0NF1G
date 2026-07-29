alias sudo="sudo "

# general
alias cd="z" # zoxide
alias v="nvim"
alias zsh-reload='source ~/.zshrc'

# dev
alias lg="lazygit"
alias lq="lazysql"

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

# git
alias gs="git status --short --branch"
alias gst="git status"

alias gsw="git switch"
alias gswc="git switch --create"

alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"

alias gm="git merge"
alias gms="git merge --squash"
alias gma="git merge --abort"

alias gl="git log --graph"
alias glp="git log --stat --patch --graph"
alias glo="git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short"

alias ga="git add"
alias gaa="git add -A"

alias gr="git restore"
alias grs="git restore --staged"

alias gc="git commit --verbose"

alias gd="git diff"
alias gf="git fetch"
alias gp="git pull"
alias gP="git push"

# yolk dotfiles
alias ygs="yolk git status --short --branch"
alias ygst="yolk git status"

alias ygsw="yolk git switch"
alias ygswc="yolk git switch --create"

alias ygb="yolk git branch"
alias ygba="yolk git branch --all"
alias ygbd="yolk git branch --delete"

alias ygm="yolk git merge"
alias ygms="yolk git merge --squash"
alias ygma="yolk git merge --abort"

alias ygl="yolk git log --graph"
alias yglp="yolk git log --stat --patch --graph"
alias yglo="yolk git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short"

alias yga="yolk git add"
alias ygaa="yolk git add -A"

alias ygr="yolk git restore"
alias ygrs="yolk git restore --staged"

alias ygc="yolk git commit --verbose"

alias ygd="yolk git diff"
alias ygf="yolk git fetch"
alias ygp="yolk git pull"
alias ygP="yolk git push"
