
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
alias lfeh='feh -F --draw-filename --draw-exif --fontpath /usr/share/fonts/truetype/liberation/ -e "LiberationSans-Regular/16"'
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
## prompt
autoload -U promptinit
promptinit
##

export PS1="%l %T %n@%m:%~$" # history.24Htime-user@host:workingdir$
#########################################
# end xian config
#########################################
