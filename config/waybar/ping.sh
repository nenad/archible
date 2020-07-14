#!/bin/sh
tmpfile=/tmp/waybar-ping
if [ -f $tmpfile ]; then
	display="$(printf '%15s' $(cat $tmpfile))"
else
	display="$(printf '%15s' '')"
fi

result=$(ping -4 -c 1 google.com -w 2)
success=$(echo "${result}" | grep received | cut -d "," -f2 | sed 's/received//' | tr --delete " ")
time=$(echo "${result}" | grep ttl | cut -d " " -f8 | sed 's/time=//')

if [ $success = "1" ]; then
	if [ $(echo $time'<40' | bc -l) -eq 1 ]; then
		
		display="${display:1}▁"
	elif [ $(echo $time'<80' | bc -l) -eq 1 ]; then
		display="${display:1}‗"
	elif [ $(echo $time'<150' | bc -l) -eq 1 ]; then
		display="${display:1}⎻"
	elif [ $(echo $time'<300' | bc -l) -eq 1 ]; then
		display="${display:1}▔"
	else
		display="${display:1}~"
	fi
else
	display="${display:1}X"
fi

printf '%5sms %s' ${time} ${display}
echo "$display" > $tmpfile
