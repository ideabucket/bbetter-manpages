#!/usr/bin/env bash

# yoink the first line of stdin (always a header with the command name)
# and generate a nice title for the BBEdit window
read HEADERLINE
MANNAME=$(echo "$HEADERLINE" | sed -E 's/^([^)]+\)).+/\1/' | tr A-Z a-z)

# splicing strings with stdin thanks to Stack Overflow user rupert160: 
# https://stackoverflow.com/a/33139133
cat <(echo "$HEADERLINE") - | \
    col -bx | \
    bbedit --new-window --clean --view-top --pipe-title "$MANNAME" --language "Manpage"
