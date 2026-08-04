#!/bin/sh

mmsg dispatch view,4

if [[ $(mmsg get focusing-client | grep kitty) == "" ]]; then
		kitty --hold sh -c ~/Scripts/firstterm.sh
		$HOME/Scripts/tmux-session-dispensary.sh $HOME/Brain/
fi
