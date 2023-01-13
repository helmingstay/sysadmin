#!/bin/bash

USAGE="USAGE: $0 ncore mem"
CMD="srun --pty  --cpus-per-task=$1 --job-name=interact --ntasks=1 --nodes=1 --partition=inter_p --time=6:00:00 --mem=$2 /bin/zsh -l"
if [ $# -ne 2 ]; then
	echo $USAGE
else
	echo $CMD
	$CMD
fi
