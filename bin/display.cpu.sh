#!/bin/sh
#avg-cpu:  %user   %nice %system %iowait  %steal   %idle
iostat -c -y 2 2 |  tail -3 | head -1 | awk '{printf "User %1.1f|Sys %1.1f|io %1.1f|Idle %1.1f", $1,$3,$4,$6}'
