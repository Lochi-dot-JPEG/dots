#!/bin/zsh

MUSICDIR=$HOME/Music/Music
#ALBUMS=$(ls $MUSICDIR)
ALBUMS=$(ls $MUSICDIR | shuf)

ROFIIN=""
for item in "$MUSICDIR/"*; do
		BASE="$(basename $item)"
		#echo "item is $item"
		ROFIIN+="$BASE\0icon\x1f/tmp/musicthumbnails/$BASE.jpg\n"
done
echo $ROFIIN

ALBUM=$(echo -en "$ROFIIN" | shuf | rofi -dmenu -case-smart -l 6 -p " " -show-icons -theme-str '
#element-text { horizontal-align: 0.5; }
#element-icon  { size: 96px; } 
#listview { expand: false; columns: 5; } 
#element { orientation: vertical; }' -font "mono 10")

echo "Album = $ALBUM"

if [[ $ALBUM != "" ]]; then
	mpc clear
	cd "$MUSICDIR/$ALBUM"
	for song in *(flac|mp3); do
		mpc add "$ALBUM/$song"
	done
	mpc play
fi
