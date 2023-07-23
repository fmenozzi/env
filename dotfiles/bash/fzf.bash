#!/usr/bin/env bash

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

export FZF_DEFAULT_COMMAND="fd . ."
export FZF_CTRL_T_COMMAND="fd . $HOME"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
