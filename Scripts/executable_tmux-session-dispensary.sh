#!/bin/bash

# Stolen from https://github.com/SylvanFranklin/.config/blob/main/scripts/tmux-session-dispensary.sh

DIRS=(
    "$HOME/Documents"
    "$HOME"
    "$HOME/Game"
    "$HOME/Projects"
    "$HOME/Videos"
)

SINGLE_DIRS=(
    "$HOME/.local/share/chezmoi"
    "$HOME/.config"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    #selected=$(fd "" "${DIRS[@]}" --type=dir --max-depth=1 --full-path \
    selected=$( (fd "" "${DIRS[@]}" --type=dir --max-depth=1 --full-path; printf "%s\n" "${SINGLE_DIRS[@]}") \
        | sed "s|^$HOME/||" \
        | sk --margin 10% --color="bw")
    [[ $selected ]] && selected="$HOME/$selected"
fi


[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

if [[ $# -eq 1 ]]; then
    tmux a -t "$selected_name"
else
    if [[ $TMUX != "" ]]; then
        tmux switch-client -t "$selected_name"
    else
        tmux a -t "$selected_name"
    fi
fi
