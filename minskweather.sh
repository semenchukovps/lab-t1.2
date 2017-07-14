#!/bin/sh

CITY_URL="https://pogoda.tut.by/city/minsk/"
DELAY=$(cat ./config.ini | sed -n '1{s/[^0-9]//g;p;q}')

while true
do
	echo "Погода в Минске на" $(date '+%d/%m  %H:%M:%S')
	curl $CITY_URL 2>/dev/null \
	| sed -n '/class="temp-i"/ {p;q}' \
	| awk '{ print substr($0, 22, 3) }'
	sleep $DELAY
done
