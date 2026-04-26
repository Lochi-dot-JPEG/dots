#!/bin/sh

# Creates new tmux session called syncthing
# Launches syncthing in that session
# Does not attach to the synchting session
# Does not open the syncthing window in the web browser
tmux new -d -s syncthing syncthing --no-browser
