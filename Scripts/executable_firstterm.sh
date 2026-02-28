#!/bin/sh
if [[ $XDG_CURRENT_DESKTOP == mango ]]; then
		mmsg -t 4
fi
if [[ $XDG_SESSION_DESKTOP == sway ]]; then
		swaymsg "move to workspace number 4, workspace number 4"
fi
$HOME/Scripts/tmux-session-dispensary.sh $HOME/Brain/
