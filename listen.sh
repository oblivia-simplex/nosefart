#! /usr/bin/env bash

fifo=$(mktemp)
rm "$fifo"
mkfifo "$fifo"

[ -p "$fifo" ] || { echo "Failed to make FIFO."; exit 1; }

nsf="$1"


aplay -f u8 -r 44100 "$fifo" &

./nsfobj/nosefart -d "$fifo" "$nsf"
