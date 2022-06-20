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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lc='wc -l'
alias o='vim $(fzf)'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Command substitutions
alias tmux='tmux -2'
alias vim='nvim'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
