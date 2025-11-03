#!/bin/sh

cd $HOME/Brain/

notify-send "Pulling..." --expire-time 2000
git pull
git add .
STATUS="Do you want to commit? "$(git status --short)
if zenity  --question --text="$STATUS"; then
		git commit -m "Automated commit $(date +%F)"
		git push
		kitty lazygit
else
		git restore --staged .
		exit
fi
