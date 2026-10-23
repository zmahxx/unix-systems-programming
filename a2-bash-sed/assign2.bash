#!/bin/bash

# Ensure at least one file is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 file1 [file2 ...]"
    exit 1
fi

# Get today's date, ensuring it doesn't break sed
TODAY=$(date +"%m/%d/%Y")

# Process each file with sed
for file in "$@"; do
    sed -e "s|<date>|$TODAY|g" -f assign2.sed "$file"
done

