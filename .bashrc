case $- in
    *i*) ;;
      *) return;;
esac

shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

case "$TERM" in
xterm*|rxvt*|dumb)
    LIGHT_GRAY="\[\033[0;37m\]"; BLUE="\[\033[1;36m\]"; RED="\[\033[0;31m\]"; LIGHT_RED="\[\033[1;31m\]";
    GREEN="\[\033[0;32m\]"; WHITE="\[\033[1;37m\]"; LIGHT_GRAY="\[\033[0;37m\]"; YELLOW="\[\033[1;33m\]";
    function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/';
    }
    function parse_git_status {
        git status 2> /dev/null | sed -e '/(working directory clean)$/!d' | wc -l;
    }
    function check_git_changes {
        # tput setaf 1 = RED, tput setaf 2 = GREEN
        [ `parse_git_status` -ne 1 ] && tput setaf 1 || tput setaf 2
    }
    export PS1="($(whoami)@$(hostname)) \[$(tput bold)\]\[$(tput setaf 2)\]\$(date +%F\|%R) $YELLOW\w\[\$(check_git_changes)\]\$(parse_git_branch)$LIGHT_GRAY\n $ "
    export PS4='+(${BASH_SOURCE}:${LINENO})'
    ;;
*)
    ;;
esac

set -o emacs
umask 002
export HISTTIMEFORMAT="%F %T "
shopt -s histappend

export TZ='/usr/share/zoneinfo/US/Eastern'
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

alias l='ls -lF'
alias ll='ls -alF'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
