#!/usr/bin/env bash

# Ignore commands with leading space and remove duplicate entries.
HISTCONTROL=erasedups:ignorespace

# Append to history file instead of overwriting it.
shopt -s histappend

HISTSIZE=10000000
HISTFILESIZE=10000000
HISTTIMEFORMAT="%FT%R "

# Append history lines from this session to the history file.
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
