#!/bin/sh

if [ $(hyprctl activewindow -j | jq ".floating") == "true" ]; then
    hyprctl dispatch cyclenext visible prev tiled
else
    hyprctl dispatch cyclenext visible prev floating
fi
