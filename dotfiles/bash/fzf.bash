# Setup fzf
# ---------
if [[ ! "$PATH" == *$DOTFILES_PATH/nvim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$DOTFILES_PATH/nvim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$DOTFILES_PATH/nvim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$DOTFILES_PATH/nvim/plugged/fzf/shell/key-bindings.bash"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind -t d . $HOME"
