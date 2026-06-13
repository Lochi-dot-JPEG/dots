#/bin/sh

# Follows whether pause/play or the title changed
playerctl metadata -f "{{title}}{{status}}" --follow | while read -r line; do
if [[ $(echo $line | grep "Playing") != "" ]]; then
		echo $(playerctl metadata -f "{{artist}} - {{title}}" )
else
		echo 
fi
done
