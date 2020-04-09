#!/bin/sh

while : 
do

if logread -e Tor | grep -q 'Tor.*100%'
then
	/bin/echo "default-on" > /sys/class/leds/tl-wr902ac-v1\:green\:internet/trigger
fi
sleep 10
done
