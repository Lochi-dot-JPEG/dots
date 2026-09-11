#!/bin/sh
clipboard=${1:-$(xclip -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}
xdg-open $clipboard
