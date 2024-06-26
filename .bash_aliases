if [[ "$(uname -a)" =~ Darwin ]]
then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi

alias l='ls -F'
alias gits='git status'
alias gitl='git log --decorate --graph --oneline --all'
alias gitll="git log --graph --all --pretty=format:'%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s'"

alias lsblk='lsblk -o NAME,FSTYPE,ROTA,LABEL,MOUNTPOINT,HOTPLUG,MODEL,RO,STATE'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias k=kubectl
alias knodes='kubectl get node -ocustom-columns=NAME:.metadata.name,AFFINITY:".metadata.labels.kubernetes\.io/node-affinity",GPU:".status.capacity.nvidia\.com/gpu",INSTANCE:".metadata.labels.beta\.kubernetes\.io/instance-type",TYPE:".metadata.labels.clarabridge\.com/node-type",POOL:".metadata.labels.ibm-cloud\.kubernetes\.io/worker-pool-name"'
alias kpods='kubectl get pods -owide'
alias kcc='k config get-contexts $(k config current-context)'
#alias scaledown='k get ns | awk \'/ralgara/ { print $1; }\' | while read ns; do k get deploy -n $ns | awk \'NR>1 {print $1;}\' | while read deployment; do kubectl scale -n $ns deploy/$deployment --replicas=0; done; done'

alias aws-mfa=~/Library/Python/3.9/bin/aws-mfa
alias awsme="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara"
alias awsdev="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::932043579407:role/OrgAdminRole"
alias awstest="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::986620538101:role/OrgAdminRole"
alias awsstage="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::028043180692:role/OrgAdminRole"
alias awsprod="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::361118970338:role/OrgAdminRole"
alias awsca="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::125782571003:role/OrgAdminRole"
alias awsuk="aws-mfa --duration 43200 --device arn:aws:iam::799231120095:mfa/rafael.algara --assume-role arn:aws:iam::803943148377:role/OrgAdminRole"
