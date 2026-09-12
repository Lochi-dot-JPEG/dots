#!/bin/bash

BOOKMARKFILE="$HOME/Brain/life/status/bookmarks.md"

CATEGORY="GENERAL"

# Creates an associative array
# Display name: script path from ~/Scripts/
declare -A links=(
[0 Maths]="textbook.sh zathura maths/0-CambridgeY11Ext1.pdf" 
[1 Read]="texts.sh zathura"
[2 Pick album]=play_album.zsh
[3 Bookmarks]=bookmarks.sh
[Random album]=random_album.zsh
[Define]=define.sh
[Generate thumbnails]=generate_all_album_thumbnails.sh
[Start Syncthing]=start-syncthing.sh
[Quick notes]=quick_notes.sh
[Annotate]="texts.sh okular"
[Unblock Site]="unblock_site_terminal_opener.sh"
[Open Clipboard URL]="clipboard_url.sh"
[Textbooks]="textbook.sh zathura" 
)

KEYS=""

for key in "${!links[@]}"; do 
		KEYS+="${key}\n"
done

#head removes trailing newline

OUT=${links[$(echo -e $KEYS | head -c -1 | sort | rofi -dmenu -matching prefix -case-smart -p "run ")]}

sh -c "~/Scripts/$OUT"
