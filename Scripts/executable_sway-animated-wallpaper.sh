#!/bin/sh

WALL_DIR=$HOME/Pictures/AnimatedWallpapers/horizontal/
COLS=$(tput cols)
#SELECTION=$(ls ~/Pictures/Wallpapers | gum filter --limit 1 --placeholder 'Pick a wallpaper' --prompt='>')

SELECTION=$(ls $WALL_DIR | shuf -n 1)

if [[ $SELECTION != '' ]]; then
	killall swaybg
	killall mpvpaper
	mpvpaper ALL $WALL_DIR/$SELECTION -o "--loop=inf --panscan=1 --scale=nearest"
	#rm ~/.config/swaylock/lockimage
	#ln -s "$WALL_DIR/$SELECTION" ~/.config/swaylock/lockimage
fi
