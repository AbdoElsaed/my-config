#!/bin/bash

### example usage -> ./remove_all_except_folders /path/to/location folder1 folder2 folder3

LOCATION=$1
EXCLUDED_FOLDERS=("$@")
EXCLUDED_FOLDERS=("${EXCLUDED_FOLDERS[@]:1}")

for d in $LOCATION/*/ ; do
  dir=${d%*/}
  dir=${dir##*/}
  if ! [[ "${EXCLUDED_FOLDERS[@]}" =~ "$dir" ]]; then
    rm -rf "$d"
  fi
done
 

