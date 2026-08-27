#!/bin/zsh

TEXTBOOKS=$HOME/Texts/textbooks/
cd $TEXTBOOKS
BOOKS=$(find -type f)
if [[ $2 == "" ]]; then
		BOOK=$(echo $BOOKS | rofi -dmenu -case-smart)
else
		BOOK=$2
fi
if [[ "$BOOK" == "" ]]; then
		exit
fi
COUNT=$(echo "1\n2\n3\n4" | rofi -dmenu -p "How many instances?")

for i in {1..$COUNT}; do
		$1 "$TEXTBOOKS/$BOOK" &
done
