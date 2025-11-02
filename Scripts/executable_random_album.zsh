#!/bin/zsh

MUSICDIR=$HOME/Music/Music
ALBUM=$(ls $MUSICDIR | shuf -n 1)

if [[ $ALBUM != '' ]]; then
	mpc clear
	cd $MUSICDIR/$ALBUM
	for song in *(flac|mp3); do
		mpc add "$ALBUM/$song"
	done
	mpc play
fi
