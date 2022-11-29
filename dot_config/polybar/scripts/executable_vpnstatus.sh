#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo "%{F#BE56FF} $(ifconfig tun0 | grep inet | awk '{print $2}' | cut -f2 -d ':')%{F-}"
else
    echo "%{F#FF006F}"
fi
