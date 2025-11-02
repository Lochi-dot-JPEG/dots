#!/usr/bin/sh

sleep $1 # For delaying on startup

WALLPAPER_DIR="$HOME/Pictures/GruvboxWallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f -name "*.jpg" -o -name "*.png" ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
