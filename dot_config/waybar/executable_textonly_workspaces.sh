#!/bin/sh

mmsg watch all-tags | while read -r line; do
#FOCUSED=$(echo "$line" | jq '.all_tags[].tags[] | select(.is_active == true) | .index')
#mmsg watch focusing-client | while read -r line; do
#FOCUSED=$(echo "$line" | jq '.tags[]')
		FOCUSED=$(mmsg get all-monitors | jq '.monitors[] | select(.active == true).tags[] | select(.is_active == true).index')
		if [[ $FOCUSED == "1" ]]; then
			echo     
		elif [[ $FOCUSED == "2" ]]; then
			echo     
		elif [[ $FOCUSED == "3" ]]; then
			echo     
		elif [[ $FOCUSED == "4" ]]; then
			echo      
		else
			echo     
		fi
done

