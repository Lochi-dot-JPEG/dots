#!/bin/sh
#[[ -z $(pgrep -xU $UID mpd) ]] && mpd &
systemctl --user start mpd.service
[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &
sleep 2
[[ -z $(pgrep -xU $UID mpd-mpris) ]] && mpd-mpris &
#[[ -z $(pgrep -xU $UID mprisence) ]] && mprisence &

