
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#
zstyle :compinstall filename '/home/xian/.zshrc'
export EDITOR=/usr/bin/vim

autoload -Uz compinit
compinit
# End of lines added by compinstall

#########################################
# xian config
########################################
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
fi
export PATH=$PATH:~/local/bin
# shell/cli related
alias xb='xbacklight -set'
alias disp='export DISPLAY=:0.0'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias lls='ls -alh'                 
alias lsh='ls -alh . | head'                 
alias lsw='ls -alh . | wc'                 
## other double-letter customs
alias ddf='df -kh'
alias ddu='du -sh'
alias RR='R --no-restore-data --no-save'
alias vi='vim'
alias grep='grep --color -n'
alias rvn='R --no-restore-data'
alias rvn_clean='R --vanilla'
## zsh key bindings
bindkey '^R' history-incremental-search-backward
## my bin
#export PATH=$PATH:~/bin:~/src/gocode/bin
export PAGER=less
export LESS="-iMSx4 -FX"
export PGDATABASE=iquitos
export BUILDDIR=~/build


## programs
alias xbs='xbacklight -set'
alias ino.serial='ino serial -- --escape p'
alias lxauto='vi ~/.config/lxsession/LXDE/autostart'
alias lfeh='feh -F --draw-filename --draw-exif --fontpath /usr/share/fonts/truetype/liberation/ -e "LiberationSans-Regular/16"'
alias my.iftop='sudo iftop -c ~xian/.iftoprc -n -i wlan0'
## prompt
autoload -U promptinit
promptinit

autoload -U colors && colors
##
#PS1='\[\033[01;34m\]%l %T %n@%m:\[\033[00m\]%~\[\033[01;32m\]$[\033[00m\]' 
PS1="%{$fg[blue]%}%l %T %n@%m:%{$reset_color%}%{$fg[green]%}%~$%{$reset_color%}" # history.24Htime-user@host:workingdir$
#########################################
# end xian config
#########################################
