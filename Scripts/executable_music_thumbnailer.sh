#!/bin/sh

FOLDER=$1

OUTPUT_PATH=$HOME/.cache/musicthumbnails
MUSIC_DIRECTORY=$HOME/Music/Music

mkdir -p $OUTPUT_PATH

if [ -f "$OUTPUT_PATH/$FOLDER.jpg" ]; then
		exit
fi

COVER=$(find "$MUSIC_DIRECTORY/$FOLDER" -iname 'cover.*')
if [ ! -f "$COVER" ]; then
		# Gets random flac or mp3
		FIRSTFLAC=$(ls "$MUSIC_DIRECTORY/$FOLDER"/*.flac | shuf -n 1)
		if [ ! "$FIRSTFLAC" ]; then
				FIRSTFLAC=$(ls "$MUSIC_DIRECTORY/$FOLDER"/*.mp3 | shuf -n 1)
		fi
		if [ -n "$FIRSTFLAC" ]; then
				ffmpeg -i "$FIRSTFLAC" -map 0:1 -c:v copy -n "$MUSIC_DIRECTORY/$FOLDER/cover.jpg"
				COVER=$(find "$MUSIC_DIRECTORY/$FOLDER" -iname 'cover.*')
		fi
fi
if [ -n "$COVER" ]; then
		ffmpeg -i "$COVER" -vf scale=128:128 -y "$OUTPUT_PATH/$FOLDER.jpg"
		notify-send "Saved $1"
fi
