#!/bin/sh


WORK_PATH="/home/glbe/Downloads/Waterfox"


idx=1
for file_path in "$WORK_PATH"/*; do
  base_file_path="$(basename -- "$file_path")"
  file_dir="$(dirname -- "$file_path")"

  mv "$file_path" "$file_dir/$idx. $base_file_path"

  ((idx++))
done