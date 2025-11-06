#!/bin/zsh

TEXTBOOKS=$HOME/Documents/textbooks
BOOKS=$(ls $TEXTBOOKS)
BOOK=$(echo $BOOKS | rofi -dmenu -case-smart)

if [[ "$BOOK" != "" ]]; then
		zathura "$TEXTBOOKS/$BOOK"
fi
