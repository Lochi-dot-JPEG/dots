#!/bin/sh

mmsg -t 4

if [[ $(mmsg -g -c | grep kitty) == "" ]]; then
		kitty --hold sh -c ~/Scripts/firstterm.sh
fi
