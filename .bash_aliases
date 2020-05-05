if [[ "$(uname -a)" =~ Darwin ]]
then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi

alias l='ls -F'
alias gitlog='git log --decorate --graph --oneline --all'
alias gitlogl="git log --graph --all --pretty=format:'%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s'"
alias lsblk='lsblk -o NAME,FSTYPE,ROTA,LABEL,MOUNTPOINT,HOTPLUG,MODEL,RO,STATE'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias k=kubectl
alias knodes='kubectl get node -ocustom-columns=NAME:.metadata.name,AFFINITY:".metadata.labels.kubernetes\.io/node-affinity",GPU:".status.capacity.nvidia\.com/gpu",INSTANCE:".metadata.labels.beta\.kubernetes\.io/instance-type",TYPE:".metadata.labels.clarabridge\.com/node-type",POOL:".metadata.labels.ibm-cloud\.kubernetes\.io/worker-pool-name"'
alias kpods='kubectl get pods -nnlp -owide'
