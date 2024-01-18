#!/bin/bash

## for srun environment, see:
# https://slurm.schedmd.com/srun.html#SECTION_OUTPUT-ENVIRONMENT-VARIABLES

USAGE="USAGE: $0 ncore GB hours"
CMD="srun --pty  --constraint=EDR --cpus-per-task=$1 --mem=${2}GB --job-name=interact --ntasks=1 --nodes=1 --partition=inter_p --time=${3}:00:00 /bin/zsh -l"
if [ $# -ne 3 ]; then
	echo $USAGE
else
	echo $CMD
	$CMD
fi
