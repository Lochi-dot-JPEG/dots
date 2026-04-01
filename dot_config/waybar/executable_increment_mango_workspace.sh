#!/bin/sh

FOCUSEDLINE=$(mmsg -g -t | grep "tag . 1")
FOCUSED=${FOCUSEDLINE: -7: 1}

NEW=$(($FOCUSED + $1))

if [[ $NEW < 6 && $NEW > 0 ]]; then
		mmsg -t $NEW
fi
