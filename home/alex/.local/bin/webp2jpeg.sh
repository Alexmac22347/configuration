#!/bin/bash
for file in *.webp; do
    output="${file%.webp}.jpeg"
    ffmpeg -i "$file" -quality 95 "$output"
done
