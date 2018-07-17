#!/bin/bash

CITY_URL="https://pogoda.tut.by/city/minsk/"

source ./config.ini

while true
do
	echo "Погода в Минске на" $(date '+%d/%m  %H:%M:%S')
	curl $CITY_URL 2>/dev/null \
	| sed -n '/class="temp-i"/ {p;q}' \
	| awk '{ print substr($0, 22, 3) }'
	sleep $update_value_sec
done
