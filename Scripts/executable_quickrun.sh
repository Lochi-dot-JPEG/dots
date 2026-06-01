#!/bin/bash

BOOKMARKFILE="$HOME/Brain/life/status/bookmarks.md"

CATEGORY="GENERAL"

# Creates an associative array
# Display name: script path from ~/Scripts/
declare -A links=(
[0 Textbooks]=textbook.sh
[1 Read]=texts.sh
[2 Pick album]=play_album.zsh
[3 Bookmarks]=bookmarks.sh
[4 Random album]=random_album.zsh
[5 Define]=define.sh
[6 Generate thumbnails]=generate_all_album_thumbnails.sh
[7 Start Syncthing]=start-syncthing.sh
[8 Godot order]=godot_code_order.sh
)

KEYS=""

for key in "${!links[@]}"; do 
		KEYS+="${key}\n"
done

#head removes trailing newline

OUT=${links[$(echo -e $KEYS | head -c -1 | sort | rofi -dmenu -matching prefix -case-smart -p "run ")]}

sh -c "~/Scripts/$OUT"
