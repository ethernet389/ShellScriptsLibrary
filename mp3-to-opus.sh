#!/bin/bash

INPUT_PATH="$1"
OUTPUT_PATH="$2"

mkdir -p $OUTPUT_PATH

find $INPUT_PATH \
  -name '*.mp3' \
  -type f \
  -exec bash -c \
    '
      INPUT_PATH="$2"
      OUTPUT_PATH="$3"
      rel_path="${1#$INPUT_PATH/}"
      out_dir="$OUTPUT_PATH/$(dirname "$rel_path")"
      out_path="$out_dir/$(basename "$rel_path" .mp3).opus"
      mkdir -p "$out_dir"
      echo "FROM: [ $1" ]
      echo "TO:   [ $out_path" ]
      ffmpeg -i "$1" -c:a libopus -b:a 128k -vbr on -compression_level 10 -loglevel error -y "$out_path"
      echo "CONVERSION DONE: $?"
      echo
    ' bash {} $INPUT_PATH $OUTPUT_PATH \;