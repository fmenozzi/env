#!/usr/bin/env bash

# Common misspellings
alias sl='ls'
alias clare='clear'
alias lear='clear'
alias clea='clear'
alias lcear='clear'
alias amke='make'
alias mkae='make'
alias maek='make'

# Git
alias gits='git status'
alias gitl='git log'
alias gitd='git diff'
alias gitdc='git diff --cached'

# Shortened/custom commands
alias ls='ls --color=auto'
alias l='exa -lb --color=always --group-directories-first'
alias ll='exa -alb --color=always --group-directories-first'
alias lc='wc -l'
alias cl='clear; l'
alias o='vim $(fzf)'
alias c='clear'
alias grep='grep --color=auto'
alias rg-all='rg --hidden --no-ignore'
alias fd-all='fd --hidden --no-ignore'
alias vpn='protonvpn-cli'
alias pacoverview="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

# Extract from various archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.tar.xz)    tar xJf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Kitty image viewer
alias imcat='kitty +kitten icat'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=normal -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Command substitutions
alias tmux='tmux -2'
alias vim='nvim'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
