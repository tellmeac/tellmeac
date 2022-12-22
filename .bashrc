#! /bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# input promt
export PS1="\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\] -> \[\033[0m\]";

# append to the history file, don't overwrite it
shopt -s histappend
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# history size
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# import aliases
if [ -f ~/.bash_aliases ]; then 
  . ~/.bash_aliases
fi

# import paths
if [ -f ~/.bash_paths ]; then 
  . ~/.bash_paths
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
