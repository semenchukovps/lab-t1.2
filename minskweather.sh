#!/bin/sh

CITY_URL="https://pogoda.tut.by/city/minsk/"
DELAY=$(cat ./config.ini)

while true
do
	curl $CITY_URL 2>/dev/null \
	| sed -n '/class="temp-i"/ {p;q}' \
	| awk '{print substr($0, 22, 3)}'
	sleep $DELAY
done
