#!/bin/zsh

TEXTS="$HOME/Texts/"
cd $TEXTS
BOOKS=$(find -type f)
#BOOKS=$(find $TEXTS -name "*.epub" -printf "%f\n")
#PDFBOOKS=$(find $TEXTS -name "*.pdf" -printf "%f\n")

#BOOK=$(echo "$BOOKS\n$PDFBOOKS" | rofi -dmenu -case-smart)
BOOK=$(echo "$BOOKS" | rofi -dmenu -case-smart)
if [[ "$BOOK" == "" ]]; then
		exit
fi
echo $BOOK

#BOOKPATH=$(find $TEXTS -name "$BOOK")
#echo $BOOKPATH

COUNT=$(echo "1\n2\n3\n4" | rofi -dmenu -p "How many instances?")

for i in {1..$COUNT}; do
		$1 "$BOOK" &
done

