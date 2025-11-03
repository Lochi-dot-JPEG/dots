#!/bin/zsh

TEXTBOOKS=$HOME/Documents/textbooks
BOOKS=$(ls $TEXTBOOKS)
BOOK=$(echo $BOOKS | rofi -dmenu -case-smart)
zathura "$TEXTBOOKS/$BOOK"
