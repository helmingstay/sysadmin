#!/bin/bash
## fetch oauth token from password
token=$(mk.dewey.sh)
## see https://stackoverflow.com/questions/40986340/how-to-wget-a-list-of-urls-in-a-text-file
time cat $1 | xargs -n6 -P8 wget -P ~/xian.scratch/dewey --continue --header="Authorization: Bearer $token" 
