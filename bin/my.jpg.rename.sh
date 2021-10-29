#!/bin/zsh
## https://askubuntu.com/questions/636138/renaming-files-by-their-modification-date
time exiftool -progress -m -q -q '-filename<ModifyDate' -d lapse.%Y-%m-%d.%H:%M:%S.%%C.%%le -ext jpg -r ./

