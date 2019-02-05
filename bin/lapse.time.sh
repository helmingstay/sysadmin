#!/bin/bash
usage="
## Usage:
lapse.time.sh fps dir_with_jpgs
"
if [ $# -ne 2 ]; then
    (>&2 echo $usage)
    # TODO: print usage
    exit 1
fi

python ~/projects/lapsing/bin/time_captions.py $1 "$2"
