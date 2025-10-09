#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

source ~/.bashrc

# bin files
export PATH="$HOME/.dotfiles/bin/:$PATH"

# yolk dotfile manager
export YOLK_DIR="$HOME/.dotfiles"

for FILE in ~/.dotfiles/eggs/zsh/script/*; do  
    source $FILE  
done
