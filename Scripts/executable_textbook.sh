#!/bin/zsh

TEXTBOOKS=$HOME/Documents/textbooks
BOOKS=$(ls $TEXTBOOKS)
BOOK=$(echo $BOOKS | rofi -dmenu -case-smart)
if [[ "$BOOK" == "" ]]; then
		exit
fi
COUNT=$(echo "1\n2\n3\n4" | rofi -dmenu -p "How many instances?")

for i in {1..$COUNT}; do
		zathura "$TEXTBOOKS/$BOOK" &
done
