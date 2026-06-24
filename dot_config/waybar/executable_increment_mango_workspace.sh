#!/bin/sh

FOCUSED=$(mmsg get all-monitors | jq '.monitors[] | select(.active == true).tags[] | select(.is_active == true).index')

NEW=$(($FOCUSED + $1))

if [[ $NEW < 6 && $NEW > 0 ]]; then
		mmsg dispatch view, $NEW
fi
