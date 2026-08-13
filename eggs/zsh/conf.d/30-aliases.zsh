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
alias x="eza --icons --hyperlink --group-directories-first"
alias xa="eza --icons --all --hyperlink --group-directories-first"
alias xl="eza --icons --long --hyperlink --group-directories-first"
alias xla="eza --icons --long --all --hyperlink --group-directories-first"
alias xt="eza --icons --tree --hyperlink --group-directories-first"
alias xta="eza --icons --tree --all --hyperlink --group-directories-first"

# git
alias ga="git add"
alias gaa="git add -A"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gc="git commit --verbose"
alias gd="git diff"
alias gf="git fetch"
alias gl="git log --graph"
alias glo="git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short"
alias glp="git log --stat --patch --graph"
alias gm="git merge"
alias gma="git merge --abort"
alias gms="git merge --squash"
alias gp="git pull"
alias gP="git push"
alias gr="git restore"
alias grs="git restore --staged"
alias gs="git status --short --branch"
alias gst="git status"
alias gsw="git switch"
alias gswc="git switch --create"

# jj (jujutsu)
alias jja='jj abandon'
alias jjb='jj bookmark'
alias jjba='jj bookmark advance'
alias jjbc='jj bookmark create'
alias jjbd='jj bookmark delete'
alias jjbf='jj bookmark forget'
alias jjbl='jj bookmark list'
alias jjbm='jj bookmark move'
alias jjbr='jj bookmark rename'
alias jjbs='jj bookmark set'
alias jjbt='jj bookmark track'
alias jjbu='jj bookmark untrack'
alias jjc='jj commit'
alias jjcmsg='jj commit --message'
alias jjd='jj diff'
alias jjdmsg='jj desc --message'
alias jjds='jj desc'
alias jje='jj edit'
alias jjgcl='jj git clone'
alias jjgf='jj git fetch'
alias jjgfa='jj git fetch --all-remotes'
alias jjgp='jj git push'
alias jjgpa='jj git push --all'
alias jjgpd='jj git push --deleted'
alias jjgpt='jj git push --tracked'
alias jjl='jj log'
alias jjla='jj log -r "all()"'
alias jjn='jj new'
alias jjnt='jj new "trunk()"'
alias jjrb='jj rebase'
alias jjrbm='jj rebase -d "trunk()"'
alias jjrs='jj restore'
alias jjrt='cd "$(jj root || echo .)"'
alias jjsp='jj split'
alias jjsq='jj squash'
alias jjs='jj status'

# yolk dotfiles
alias yga="yolk git add"
alias ygaa="yolk git add -A"
alias ygb="yolk git branch"
alias ygba="yolk git branch --all"
alias ygbd="yolk git branch --delete"
alias ygc="yolk git commit --verbose"
alias ygd="yolk git diff"
alias ygf="yolk git fetch"
alias ygl="yolk git log --graph"
alias yglo="yolk git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short"
alias yglp="yolk git log --stat --patch --graph"
alias ygm="yolk git merge"
alias ygma="yolk git merge --abort"
alias ygms="yolk git merge --squash"
alias ygp="yolk git pull"
alias ygP="yolk git push"
alias ygr="yolk git restore"
alias ygrs="yolk git restore --staged"
alias ygs="yolk git status --short --branch"
alias ygst="yolk git status"
alias ygsw="yolk git switch"
alias ygswc="yolk git switch --create"
