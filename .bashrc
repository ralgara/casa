#!/usr/bin/env bash

case $- in
    *i*) ;;
      *) return;;
esac

set -o emacs
umask 002

shopt -s checkwinsize
shopt -s histappend

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT="%F %T "
export TZ='/usr/share/zoneinfo/US/Eastern'

if [ "$(uname)" == "Darwin" ]
then
    export JAVA_HOME=$(/usr/libexec/java_home)
else
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib/x86_64-linux-gnu/
    export JAVA_HOME=$(sed 's:/bin/.*::' < <(which java))
fi

# Append ~/bin to $PATH, deduplicate
export PATH=$(echo $PATH:~/bin | tr ':' '\n' | sort -u | grep -v '^$' | tr '\n' ':')

[ -f ~/.bash_prompt ] && source ~/.bash_prompt
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
