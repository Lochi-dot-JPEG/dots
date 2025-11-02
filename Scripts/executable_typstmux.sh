#!/bin/sh
zathura "$1.pdf" &
tmux new-session -d -s "typ$1" "tmux new-window nvim $1.typ & sleep 1; tmux new-window -a typst watch $1.typ; " \; attach


