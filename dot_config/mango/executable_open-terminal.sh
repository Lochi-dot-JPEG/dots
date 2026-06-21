#!/bin/sh

mmsg dispatch view,4

if [[ $(mmsg get focusing-client | grep kitty) == "" ]]; then
		kitty --hold sh -c ~/Scripts/firstterm.sh
fi
