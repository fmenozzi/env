DOTFILES="/home/fmenozzi/data/dotfiles/"

# Setup fzf
# ---------
if [[ ! "$PATH" == *$DOTFILES/nvim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$DOTFILES/nvim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$DOTFILES/nvim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$DOTFILES/nvim/plugged/fzf/shell/key-bindings.bash"
