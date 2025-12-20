#!/bin/zsh

cd ~/Music/Music

for i in *; do
		music_thumbnailer.sh $i
done

