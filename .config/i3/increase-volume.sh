#!/bin/bash

# The purpose of this script is to increase the volume
# without going over 100%

VOLUME=$(echo `(pactl list sinks | grep "Volume:")` | awk '{print $5}')
VOLUME=${VOLUME::-1}

if [ $VOLUME -le 95 ]; then
    pactl set-sink-volume 0 +5%
fi
