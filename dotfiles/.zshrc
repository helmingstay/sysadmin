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
## one ssh-agent shared across shells 
## https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-a-password-prompt
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

export PATH=$PATH:~/bin:~/local/bin:~/.local/bin
# shell/cli related
alias xb='brightnessctl set'
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
export BUILDDIR=~/build
## psql
export PGDATABASE=covid
#alias my.pg.carya='ssh -L 7432:localhost:5432 -N -f carya'
#export PGHOST=localhost
#export PGPORT=7432

## programs
## -U crashes network on disconnect
## 2023-12: openconnect vpn doesn't play nice with home assistant bridge
alias my.vpn="sudo openconnect --no-dtls --authgroup='01 Default' -u cg79628 remote.uga.edu"
## cleanup routes after vpn connect: more effort than its worth?
alias my.route.fix="sudo route add default gw 192.168.1.1 dev br0"

#alias my.vpn="sudo openconnect --no-dtls -U xian --authgroup='01 Default' -u cg79628 remote.uga.edu"
alias lfeh='feh -F --draw-filename --draw-exif --fontpath /usr/share/fonts/truetype/liberation/ -e "LiberationSans-Regular/16"'
alias my.iftop='sudo iftop -c ~xian/.iftoprc -n -i wlp61s0'
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
