#!/bin/sh

mmsg -w -t | grep --line-buffered "clients" | while read -r line; do
		FOCUSEDLINE=$(mmsg -g -t | grep "tag . 1")
		FOCUSED=${FOCUSEDLINE: -7: 1}

		if [[ $FOCUSED == "1" ]]; then
			echo $FOCUSED     
		elif [[ $FOCUSED == "2" ]]; then
			echo $FOCUSED     
		elif [[ $FOCUSED == "3" ]]; then
			echo $FOCUSED     
		elif [[ $FOCUSED == "4" ]]; then
			echo $FOCUSED     
		else
			echo $FOCUSED     
		fi
done
