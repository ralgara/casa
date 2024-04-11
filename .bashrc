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

#export GOPRIVATE=github.com/ClarabridgeInc
export GONOSUMDB=gitlab-app.eng.qops.net/*;
export GOPRIVATE=gitlab-app.eng.qops.net/*;
export GOPROXY=https://goproxy.eng.qops.net:1720;
export GONOPROXY=none

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
export PATH=$PATH:~/Library/Python/3.9/bin
export PATH="$PATH:$(go env GOPATH)/bin"

[ -f ~/.bash_prompt ] && source ~/.bash_prompt
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.secrets ] && source ~/.secrets

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH=$PATH:/Users/ralgara/.temporalio/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); 
for i in ${!paths[@]}; do 
if [[ ${paths[i]} == "''/Users/ralgara/.pyenv/shims''" ]]; then unset '\''paths[i]'\''; 
fi; done; 
echo "${paths[*]}"')"
export PATH="/Users/ralgara/.pyenv/shims:${PATH}"
command pyenv rehash 2>/dev/null

