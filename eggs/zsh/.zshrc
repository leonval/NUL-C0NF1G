source ~/.bashrc

# bin files
export PATH="$HOME/.dotfiles/bin/:$PATH"

# yolk dotfile manager
export YOLK_DIR="$HOME/.dotfiles"

for file in ~/.dotfiles/eggs/zsh/conf.d/*.zsh(Nn); do
    source "$file"
done

