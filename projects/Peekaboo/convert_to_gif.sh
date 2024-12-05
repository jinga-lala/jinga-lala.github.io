#!/bin/bash

# Directory containing the MP4 files
VIDEO_DIR="assets/videos/teasers/"

# Change to the directory
cd "$VIDEO_DIR"

# Loop through each MP4 file in the directory
for video in *.mp4; do
    # Extract the filename without the extension
    base_name=$(basename "$video" .mp4)

    # Convert to GIF using ffmpeg
    ffmpeg -y -i "$video" -vf "scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 "${base_name}.gif"
done
