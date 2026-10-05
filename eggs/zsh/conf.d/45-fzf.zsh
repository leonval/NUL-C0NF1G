# WARN: this depends on distro
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix' # include hidden file(s) and removes the leading ./ from results

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'
export FZF_CTRL_T_COMMAND="" # disable ctrl+t for zsh file picker

bindkey -M emacs '^F' fzf-file-widget
bindkey -M vicmd '^F' fzf-file-widget
bindkey -M viins '^F' fzf-file-widget
