
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
export IRCNICK="helmingstay"
# golang
export GOPATH=~/src/gocode
## .local: python / pip
export PATH=$PATH:~/bin:~/local/bin:~/.local/bin/
## https://fabric.io/features/distribution
export PATH="$HOME/.fastlane/bin:$PATH"
# bash keybindings?
# bindkey -v
# shell/cli related
alias xb='xbacklight -set'
alias bashrc='vi ~/.zshrc && . ~/.zshrc'
alias disp='export DISPLAY=:0.0'
#alias '?'='pushd ~'
#alias cd='pushd'
#alias pd='popd'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias lls='ls -alh'                 
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

## android studio
# https://www.airaghi.net/en/2017/09/21/linux-change-temporary-directory-for-android-studio
#export _JAVA_OPTIONS=-Djava.io.tmpdir=/home/xian/local/tmp



## programs
alias xbs='xbacklight -set'
alias ino.serial='ino serial -- --escape p'
alias lxauto='vi ~/.config/lxsession/LXDE/autostart'
alias lfeh='feh -F --draw-filename --draw-exif --fontpath /usr/share/fonts/truetype/liberation/ -e "LiberationSans-Regular/16"'
alias my.iftop='sudo iftop -c ~xian/.iftoprc -n -i wlan0'
## xian 2023-01
#alias my.vpn='/opt/cisco/anyconnect/bin/vpn connect remote.uga.edu'
alias my.vpn="sudo openconnect --no-dtls --authgroup='01 Default' -u cg79628 remote.uga.edu"
#alias my.vpn="sudo openconnect --no-dtls -U xian --authgroup='01 Default' -u cg79628 remote.uga.edu"

## prompt
autoload -U promptinit
promptinit
autoload -U colors && colors
##
#PS1='\[\033[01;34m\]%l %T %n@%m:\[\033[00m\]%~\[\033[01;32m\]$[\033[00m\]' 
PS1="%{$fg[blue]%}%l %T %n@%m:%{$reset_color%}%{$fg[green]%}%~$%{$reset_color%}" # history.24Htime-user@host:workingdir$

## ?? https://unix.stackexchange.com/questions/169241/xdg-open-doesnt-handle-percent-encoded-file-urls-with-lxde
XDG_CURRENT_DESKTOP=gnome
#########################################
# end xian config
#########################################


