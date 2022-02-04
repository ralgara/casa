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

export GOPRIVATE=github.com/ClarabridgeInc

if [ "$(uname)" == "Darwin" ]
then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export SHELL_SESSION_HISTORY=0
    export HISTFILE=~/.bash_history
else
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib/x86_64-linux-gnu/
    export JAVA_HOME=$(sed 's:/bin/.*::' < <(which java))
fi

# Append ~/bin to $PATH, deduplicate
export PATH=$(echo ~/bin:$PATH | tr ':' '\n' | sort -u | grep -v '^$' | tr '\n' ':')

[ -f ~/.bash_prompt ] && source ~/.bash_prompt
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.secrets ] && source ~/.secrets

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
