#!/bin/sh
## usb-c dock ether
sar -n DEV  5 1 | grep -a 'Average:    enx8cae4cf185ff' | awk '{printf "Eth %1.0fkD %1.0fkU", $5, $6}'
## cercis ether
#sar -n DEV  5 1 | grep -a 'Average:    enp0s31f6' | awk '{printf "Eth %1.0fKD %1.0fKU", $5, $6}'
## cercis wifi
#sar -n DEV  5 1 | grep -a 'Average:      wlp61s0' | awk '{printf "wifi: R %1.1fK T %1.1fK", $5, $6}'

