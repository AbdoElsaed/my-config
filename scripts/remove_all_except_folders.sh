#!/bin/bash

# Example -> ./remove_all_except_folders /path/to/location dir1 dir2 file1 file2

# this will delete all files and folders except the ones specified in the command arguments

LOCATION=$1
EXCLUDED_ITEMS=("$@")
EXCLUDED_ITEMS=("${EXCLUDED_ITEMS[@]:1}")

for item in $LOCATION/* ; do
  item_name=$(basename $item)
  if ! [[ "${EXCLUDED_ITEMS[@]}" =~ "$item_name" ]]; then
    if [ -d $item ]; then
      rm -rf $item
    elif [ -f $item ]; then
      rm $item
    fi
  fi
done
