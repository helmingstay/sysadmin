#!/bin/sh
cat /proc/meminfo | sed -n '/Mem[TA]/p' | awk '!(NR%2){printf "Avail %2d%%", ($2/p)*100.0}{p=$2}'
