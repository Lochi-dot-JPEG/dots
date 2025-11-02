#!/bin/sh
SELECTION=$(tmuxp ls | gum filter --limit 1 --placeholder 'Pick a sesh' --prompt='>')

if [[ $SELECTION != '' ]]; then
	if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
		tmux attach-session -t "$SESSION_NAME"
	else
		tmuxp load $SELECTION;
	fi
fi
