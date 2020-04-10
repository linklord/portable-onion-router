#!/bin/sh

torledup=0

while [ $torledup -eq 0 ]
do

if logread -e Tor | grep -q 'Tor.*100%'
then
	/bin/echo "default-on" > /sys/class/leds/tl-wr902ac-v1\:green\:internet/trigger
	torledup=1
fi
sleep 10
done
