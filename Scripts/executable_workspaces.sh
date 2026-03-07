mmsg -w -t | grep --line-buffered "clients" | while read -r line; do
#mmsg -w -t | while read -r line; do
		TAGLINE=$(mmsg -g -t | grep "tag $1")
		IS_FOCUSED=${TAGLINE: -5: 1}
		text=$1
		alt=$1
		if [[ "$IS_FOCUSED" == "1" ]]; then
				class="activebutton"
				echo { \"text\": \"$text\", \"alt\": \"$alt\", \"class\": \"$class\" }
		else
				class="normalbutton"
				echo { \"text\": \"$text\", \"alt\": \"$alt\", \"class\": \"$class\" }
		fi
done


		#OUT="Workspaces: "
		#for x in 1 2 3 4 5; do
				#echo $x
				#TAGLINE=$(mmsg -g -t | grep "tag $x")
				#IS_FOCUSED=${TAGLINE: -1}
				#if [[ "$IS_FOCUSED" == "1" ]]; then
						#OUT="${OUT}|$x|"
				#else
						#OUT="${OUT} $x "
				#fi
		#done
		#echo $OUT

