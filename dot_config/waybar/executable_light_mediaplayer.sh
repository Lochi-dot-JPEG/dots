#/bin/sh

playerctl status --follow | while read -r line; do
if [[ $line == "Playing" ]]; then
		echo $(playerctl metadata -f "{{artist}} - {{title}}" )
else
		echo 
fi
done
