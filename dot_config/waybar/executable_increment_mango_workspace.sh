#!/bin/sh

LINE=$(mmsg get all-tags)
FOCUSED=$(echo "$LINE" | jq '.all_tags[].tags[] | select(.is_active == true) | .index')

NEW=$(($FOCUSED + $1))

if [[ $NEW < 6 && $NEW > 0 ]]; then
		mmsg dispatch view, $NEW
fi
