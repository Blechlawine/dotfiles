#!/bin/bash

# Check if source and destination directories are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_dir> <destination_dir>"
    exit 1
fi

src_dir="$1"
dest_dir="$2"

# Create destination directory if it doesn't exist
mkdir -p "$dest_dir"

# Convert each .webm file
for webm in "$src_dir"/*.webm; do
    # Get just the filename without path and extension
    filename=$(basename "$webm" .webm)

    # Convert to wav
    ffmpeg -i "$webm" -vn "$dest_dir/$filename.wav"
done
