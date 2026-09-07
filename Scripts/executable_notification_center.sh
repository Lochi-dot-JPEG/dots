#!/bin/sh
sleep 3
[[ -z $(pgrep -xU $UID dunst) ]] && dunst &

