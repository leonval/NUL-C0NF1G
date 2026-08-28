# unix navigation
alias ll = ls -la
alias la = ls -a

# general
alias v = nvim

# dev
alias lg = lazygit
alias lq = lazysql

# bat
alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range

# eza 
alias x = eza --icons --hyperlink
alias xa = eza --icons --all --hyperlink
alias xl = eza --icons --long --hyperlink
alias xla = eza --icons --long -- --hyperlinkall
alias xt = eza --icons --tree --hyperlink
alias xta = eza --icons --tree --all --hyperlink

# git
alias gs = git status --short --branch
alias gst = git status
alias gl = git log --graph
alias glp = git log --stat --patch --graph
alias glo = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short
alias ga = git add
alias gaa = git add -A
alias gr = git restore
alias grs = git restore --staged
alias gc = git commit --verbose
alias gP = git push
alias gf = git fetch
alias gp = git pull
alias gd = git diff

# yolk dotfiles
alias ygs = yolk git status --short --branch
alias ygst = yolk git status
alias ygl = yolk git log --graph
alias yglp = yolk git log --stat --patch --graph
alias yglo = yolk git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short
alias yga = yolk git add
alias ygaa = yolk git add -A
alias ygr = yolk git restore
alias ygrs = yolk git restore --staged
alias ygc = yolk git commit --verbose
alias ygP = yolk git push
alias ygf = yolk git fetch
alias ygp = yolk git pull
alias ygd = yolk git diff
