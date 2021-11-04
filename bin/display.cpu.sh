#!/bin/sh
#avg-cpu:  %user   %nice %system %iowait  %steal   %idle
iostat -c -y 5 1 |  tail -4 | head -1 | awk '{printf "User %1.0f%%  Sys %1.0f%%  IO %1.0f%%  Idle %1.0f%%", $1,$3,$4,$6}'
