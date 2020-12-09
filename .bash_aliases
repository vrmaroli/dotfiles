# Simple
alias ll="ls -al"
alias please="sudo"
source ~/bash_completion.sh
complete -F _complete_alias please 

# Atom
alias a="atom"

# Git
alias gits="git status"
alias gitd="git difftool"
alias glg="git log --graph --oneline --decorate --all"
alias ggrep="git grep"

# AWS
alias awssh="ssh -i ~/.aws/vrmaroli.pem -l centos"
alias awscp="scp -i ~/.aws/vrmaroli.pem"

# VM
alias vmssh="ssh -l root"
alias vmgrep="vm list | grep"

# Kubernetes
source ~/.kube_aliases

# Date
logTimeStamp="date -u +\"%F %T\""
