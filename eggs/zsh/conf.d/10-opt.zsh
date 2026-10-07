bindkey -e

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# [SHELL BEHAVIOUR]
setopt COMPLETE_IN_WORD # Allow tab completion in the middle of a word
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY # for sharing history between zsh processes
setopt SHARE_HISTORY # for sharing history between zsh processes
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NUMERIC_GLOB_SORT

# autoload -U colors
#colors
