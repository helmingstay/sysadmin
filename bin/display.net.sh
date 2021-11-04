#!/bin/sh
sar -n DEV  5 1 | grep -a 'Average:    enp0s31f6' | awk '{printf "Eth %1.0fKD %1.0fKU", $5, $6}'
#sar -n DEV  5 1 | grep -a 'Average:      wlp61s0' | awk '{printf "wifi: R %1.1fK T %1.1fK", $5, $6}'

