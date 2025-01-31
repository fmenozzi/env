#!/usr/bin/env bash

source <(fzf --bash)

export FZF_DEFAULT_COMMAND="fd . ."
export FZF_CTRL_T_COMMAND="cat <(fd . $HOME) <(fd . /mnt/ava-raid)"
export FZF_ALT_C_COMMAND="cat <(fd -t d . $HOME) <(fd -t d . /mnt/ava-raid)"
