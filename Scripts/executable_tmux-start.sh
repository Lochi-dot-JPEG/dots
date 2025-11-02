#!/bin/bash

# Stolen from https://github.com/SylvanFranklin/.config/blob/main/scripts/tmux-session-dispensary.sh

selected="$HOME/Brain"

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

tmux a -t "$selected_name" -c "$HOME/Scripts/tmux-session-dispensary.sh"
