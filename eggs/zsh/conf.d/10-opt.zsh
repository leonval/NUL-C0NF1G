setopt COMPLETE_IN_WORD # Allow tab completion in the middle of a word

# VIM MODE CONFIG - START
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape depending on Vi mode in WezTerm
function update_vi_mode_ui {
    local mode="INSERT"
    if [[ ${KEYMAP} == vicmd ]]; then
	mode="NORMAL"
	echo -ne '\e[2 q' # Solid Block cursor (█) for Normal Mode
    else
	echo -ne '\e[6 q' # Steady Beam cursor (|) for Insert Mode
    fi

    # Send user variable VI_MODE to WezTerm via OSC 1337
    printf "\033]1337;SetUserVar=%s=%s\007" "VI_MODE" $(echo -n "$mode" | base64)
}

function zle-keymap-select {
    update_vi_mode_ui
}
zle -N zle-keymap-select

function zle-line-init {
    update_vi_mode_ui
}
zle -N zle-line-init

# Reset state when running a command
function preexec {
    echo -ne '\e[6 q' # Reset cursor to beam
    printf "\033]1337;SetUserVar=%s=%s\007" "VI_MODE" $(echo -n "RUNNING" | base64)
}

## Rebind Vim keys
bindkey -M viins '^A' beginning-of-line # press Home to go to beginning of line
bindkey -M viins '^E' end-of-line # press End to go to end of line
bindkey -M viins '\eb' backward-word # press Ctrl+ArrowLeft to go left one word
bindkey -M viins '\ef' forward-word # press Ctrl+ArrowRight to go right one word
# VIM MODE CONFIG - END

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
