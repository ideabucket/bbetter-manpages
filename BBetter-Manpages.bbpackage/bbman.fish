#!/usr/bin/env fish

# yoink the first line of stdin (always a header with the command name)
# and generate a nice title for the BBEdit window
col -bx | read -z manbuffer
set -l manname (string lower (string match -r '^[^)]+\)' $manbuffer))

# now open bbedit to view the manpage, with the window title
echo $manbuffer | bbedit --new-window --clean --view-top -m "manpage" -t $manname