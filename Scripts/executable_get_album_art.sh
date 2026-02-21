#!/usr/bin/bash

MUSIC_DIR=~/Music/Music
COVER_DIR=$HOME/.cache/musicthumbnails

ALBUM_DIR=$(dirname "$(mpc current -f "%file%")")
COVER_PATH="$COVER_DIR/$ALBUM_DIR.jpg"

if [[ $(mpc | grep paused) == "" ]]; then
		echo "$COVER_PATH"
else
		echo "$COVER_DIR/empty.png"
fi
