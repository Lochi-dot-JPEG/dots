#!/bin/sh
# Type in the desktop entry

NEWBROWSER=$(ls /usr/share/applications/ | fzf)

xdg-mime default $NEWBROWSER x-scheme-handler/https
xdg-mime default $NEWBROWSER x-scheme-handler/http
xdg-settings set default-web-browser $NEWBROWSER
