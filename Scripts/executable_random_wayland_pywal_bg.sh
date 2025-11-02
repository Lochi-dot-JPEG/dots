#!/bin/sh

WALL_DIR=$HOME/Pictures/Wallpapers
COLS=$(tput cols)
#SELECTION=$(ls ~/Pictures/Wallpapers | gum filter --limit 1 --placeholder 'Pick a wallpaper' --prompt='>')

SELECTION=$(ls $WALL_DIR | shuf -n 1)

if [[ $SELECTION != '' ]]; then
	killall swaybg
	~/.local/bin/wal -i ~/Pictures/Wallpapers/$SELECTION
	swaybg -i ~/Pictures/Wallpapers/$SELECTION -m fill &

	BG=$(jq .special.foreground ~/.cache/wal/colors.json)
	BG="${BG//\"/}"
	BG="0x${BG//#/}"

	FG=$(jq .special.cursor ~/.cache/wal/colors.json)
	FG="${FG//\"/}"
	FG="0x${FG//#/}"
fi
