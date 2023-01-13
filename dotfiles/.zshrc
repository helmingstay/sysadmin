# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cg79628/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# xian 2021-01
#export PATH=$PATH:~/bin:~/local/bin
export PATH=$PATH:~/local/bin
export PAGER=less
export EDITOR=/usr/bin/vim
TERM=xterm-256color

bindkey '^R' history-incremental-search-backward 

## setup prompt
autoload -U promptinit
promptinit
autoload -U colors && colors
##
##PS1='\[\033[01;34m\]%l %T %n@%m:\[\033[00m\]%~\[\033[01;32m\]$[\033[00m\]' 
PS1="%{$fg[green]%}%l %T %n@%m:%{$reset_color%}%{$fg[green]%}%~$%{$reset_color%}" # history.24Htime-user@host:workingdir$

alias my.mod.R='module load R/4.2.1-foss-2020b'
alias lls='ls -alh'
