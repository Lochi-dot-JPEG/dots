#!/bin/sh

JOURNAL_PATH=$HOME/Documents/journal/

mkdir -p $JOURNAL_PATH

if [[ $1 == "" ]]; then
		echo "Input a file name"
		exit
fi
echo "---
created: $(date +%F)
---

# $1

" > "$JOURNAL_PATH/$(date +%F)-$1.md"
nvim "$JOURNAL_PATH/$(date +%F)-$1.md"
