awk -F: '{ split($5, name, " "); print name[2] ":" $0 }' "$1" | sort | cut -d: -f2-
