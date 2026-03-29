#!/bin/sh

WALL_DIR=$HOME/Pictures/Wallpapers
COLS=$(tput cols)
#SELECTION=$(ls ~/Pictures/Wallpapers | gum filter --limit 1 --placeholder 'Pick a wallpaper' --prompt='>')

SELECTION=$(ls $WALL_DIR | shuf -n 1)

if [[ $SELECTION != '' ]]; then
	killall swaybg
	swaybg -i $WALL_DIR/$SELECTION -m fill & disown
	rm ~/.config/swaylock/lockimage
	ln -s "$WALL_DIR/$SELECTION" ~/.config/swaylock/lockimage

fi
