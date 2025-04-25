if [ "$#" -ne 2 ]; then
  
  exit 1
fi

input_dir="$1"
output_dir="$2"


generate_unique_filename() {
  base="$1"
  ext="$2"
  dir="$3"
  count=1
  newname="${base}${ext}"
  while [ -e "$dir/$newname" ]; do
    newname="${base}${count}${ext}"
    count=$((count + 1))
  done
}

find "$input_dir" -type f | while read -r filepath; do
  filename=$(basename "$filepath")
  name="${filename%.*}"
  ext="${filename##*.}"
  if [ "$name" = "$ext" ]; then
    ext=""
  else
    ext=".$ext"
  fi
  unique_name=$(generate_unique_filename "$name" "$ext" "$output_dir")
  cp "$filepath" "$output_dir/$unique_name"
done

