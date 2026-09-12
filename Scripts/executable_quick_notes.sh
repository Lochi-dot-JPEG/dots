#!/bin/sh


GODOTORDER="01. @tool, @icon, @static_unload
02. class_name
03. extends
04. ## doc comment
05. signals
06. enums
07. constants
08. static variables
09. @export variables
10. remaining regular variables
11. @onready variables
12. _static_init()
13. remaining static methods
14. overridden built-in virtual methods:
	1. _init()
	2. _enter_tree()
	3. _ready()
	4. _process()
	5. _physics_process()
	6. remaining virtual methods
15. overridden custom methods
16. remaining methods
17. inner classes"

# This is just a placeholder before I find other things I need to reference
CORDER="1. License/Documentation
2. Preprocessor Section (headers)
3. Definitions
4. Global declarations
5. Main function
6. User defined functions "

declare -A notes=(
[Godot code order]=$GODOTORDER
[CFileOrder]=$CORDER
)


KEYS=""
for key in "${!notes[@]}"; do 
		KEYS+="${key}\n"
done

SELECTION=$(echo -e $KEYS | head -c -1 | sort | rofi -dmenu -case-smart)
if [[ $(echo $?) != 0 ]]; then
		exit
fi
echo $SELECTION

notify-send -t 30000 "$SELECTION" "${notes[$SELECTION]}"
