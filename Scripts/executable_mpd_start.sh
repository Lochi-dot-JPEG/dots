#!/bin/sh
[[ -z $(pgrep -xU $UID mpd) ]] && mpd &
[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &
sleep 2
[[ -z $(pgrep -f 'mpDris2') ]] && mpDris2 &
