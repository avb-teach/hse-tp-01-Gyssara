#!/bin/bash
if [ "$#" -ne 2 ]; then

  exit 1
fi

input_dir="$1"
output_dir="$2"


find "$input_dir" -type f | while read -r filepath; do
  filename=$(basename "$filepath")
  name="${filename%.*}"
  ext="${filename##*.}"
  if [ "$name" = "$ext" ]; then
    ext=""
  else
    ext=".$ext"
  fi
  cp "$filepath" "$output_dir/$unique_name"
done