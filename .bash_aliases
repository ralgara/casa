if [[ "$(uname -a)" =~ Darwin ]]
then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi

alias l='ls -F'
alias ll='l -lh'
alias gitlog='git log --decorate --graph --oneline --all'
alias lsblk='lsblk -o NAME,FSTYPE,ROTA,LABEL,MOUNTPOINT,HOTPLUG,MODEL,RO,STATE'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
