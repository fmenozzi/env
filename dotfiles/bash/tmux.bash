#!/usr/bin/env bash

# "Alias" for "tmux a -t <session>" (with tab completion)
ta() {
    local session_name="$1"
    tmux a -t "$session_name"
}
_ta() {
    COMPREPLY=()
    local session="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$(tmux list-sessions 2>/dev/null | awk -F: '{ print $1 }')" -- "$session") )
}
complete -F _ta ta

# "Alias" for "tmux new -s <session>"
tn() {
    local session_name="$1"
    tmux new -s "$session_name"
}

# "Alias" for "tmux ls" (prettier output)
tl() {
    # Get current session name (empty string if detached)
    local session_name=$(tmux ls -F '#{session_name} #{session_attached}' | awk '$2=="1" {print $1}')

    # Print each session, with a different color for the current one
    IFS=$'\n'
    local all_session_names=($(tmux ls -F '#{session_name}'))
    for s in "${all_session_names[@]}"; do
        if [ "$s" == "$session_name" ]; then
            echo -e "${bldcyn}$s *${txtrst}"
        else
            echo -e "${txtgrn}$s${txtrst}"
        fi
    done
    unset IFS
}
