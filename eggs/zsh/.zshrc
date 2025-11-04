source ~/.bashrc

# bin files
export PATH="$HOME/.dotfiles/bin/:$PATH"

# yolk dotfile manager
export YOLK_DIR="$HOME/.dotfiles"

for FILE in ~/.dotfiles/eggs/zsh/config/*; do  
    source $FILE  
done

# bun completions
[ -s "/home/nnoel/.bun/_bun" ] && source "/home/nnoel/.bun/_bun"
