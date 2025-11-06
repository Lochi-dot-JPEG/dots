#!/bin/sh

BOOKMARKFILE="$HOME/Brain/life/status/bookmarks.md"

CATEGORY="GENERAL"

# Creates an associative array
# Display name: script path from ~/Scripts/
declare -A links=(
[Push Notes]=push_notes.sh
[Bookmarks]=bookmarks.sh
[Play random album]=random_album.zsh
[Pick album]=play_album.zsh
[Textbooks]=textbook.sh
)

KEYS=""

for key in "${!links[@]}"; do 
		
		KEYS+=$key; 
		KEYS+='\n'; 
done

OUT=${links[$(echo -e $KEYS | rofi -dmenu -case-smart -p " ")]}

sh -c "~/Scripts/$OUT"
