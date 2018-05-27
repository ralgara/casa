#!/usr/bin/env bash

case $- in
    *i*) ;;
      *) return;;
esac

set -o emacs
umask 002

shopt -s checkwinsize
shopt -s histappend

export HISTSIZE=1000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T "
export TZ='/usr/share/zoneinfo/US/Eastern'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib/x86_64-linux-gnu/
export JAVA_HOME=/usr/java/jdk1.8.0_144

[ -f ~/.bash_prompt ] && source .bash_prompt
[ -f ~/.bash_aliases ] && source .bash_aliases
