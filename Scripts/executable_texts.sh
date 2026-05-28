#!/bin/zsh

TEXTS="$HOME/Texts/"
BOOKS=$(find $TEXTS -name "*.epub" -printf "%f\n")
BOOK=$(echo $BOOKS | rofi -dmenu -case-smart)
if [[ "$BOOK" == "" ]]; then
		exit
fi

BOOKPATH=$(find $TEXTS -name "$BOOK")

COUNT=$(echo "1\n2\n3\n4" | rofi -dmenu -p "How many instances?")

for i in {1..$COUNT}; do
		zathura "$BOOKPATH" &
done

