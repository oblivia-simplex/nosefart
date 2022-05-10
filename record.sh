#! /usr/bin/env bash

tmp=$(mktemp)
#rm "$fifo"
#mkfifo "$fifo"

[ -f "$tmp" ] || { echo "Failed to make tmp file."; exit 1; }

nsf="$1"


#aplay -f u8 -r 44100 "$fifo" &

./nsfobj/nosefart -B8 -d "$tmp" -l 10 "$nsf"

ls -hl $tmp
file $tmp

rm -f music.wav
ffmpeg -f u8 -c:a pcm_u8 -ar 44.1k -i "$tmp" "music.wav"

echo "Finished music.wav"
aplay music.wav


