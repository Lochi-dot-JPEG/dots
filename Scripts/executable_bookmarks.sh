#!/bin/sh

BOOKMARKFILE="$HOME/Brain/life/status/bookmarks.md"

CATEGORY="GENERAL"

# Creates an array
declare -a links

while IFS= read -r line; do
	echo "$line"
	if [[ $line =~ "## " ]]; then
		CATEGORY="${line//## /}"
		echo "Category is $CATEGORY"
	fi
	if [[ $line =~ "http" ]]; then
		links+=( "$CATEGORY $line" )
	fi
done < "$BOOKMARKFILE"

PICKED=$(printf "%s\n" "${links[@]}" | rofi -dmenu -case-smart -p " ")
xdg-open "${PICKED//* /}"
