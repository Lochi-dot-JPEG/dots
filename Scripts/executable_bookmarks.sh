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
LINK="${PICKED//* /}"

# Splits deliminator ; from the link line
LINK=$(echo $LINK | cut -d";" --fields 2-)
xdg-open $LINK
