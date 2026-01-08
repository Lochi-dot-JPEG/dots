
#!/bin/sh

TASK=$(cat "$HOME/Brain/notes/dailies/$(date +%Y-%m-%d.md)" | grep "[>]" | sed 's/- \[>\] //g')

if [[ $TASK == "" ]]; then
		exit;
fi

if [[ $(echo $TASK | cut -c 3) == ":" && $(echo $TASK | cut -c 11) == ":" ]]; then
		NOW=$(date +%s)

		ENDTIMESTAMP=$(echo $TASK | cut -c 9-13)
		END=$(date --date "$ENDTIMESTAMP" +%s)

		DIFFERENCE=$(date -d@$((END-NOW)) -u +%k:%M:%S)

		NOTIME=$(echo $TASK | cut -c 15-)

		echo "Doing: $NOTIME $DIFFERENCE"
else
		echo "Doing: $TASK"
fi



