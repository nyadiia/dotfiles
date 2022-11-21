#!/bin/bash

# see man zscroll for documentation of the following parameters
SCRIPT=$HOME/.config/polybar/scripts/get_spotify_status.sh
zscroll -l 30 \
        --delay 0.1 \
        --scroll-padding " ~ " \
        --match-command "$SCRIPT --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$SCRIPT" &
wait
