# Simple
alias ll="ls -al"

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

# CD
alias cdm="cd /home/vrmaroli/monorepo/"
alias cds="cd /home/vrmaroli/monorepo/src/"
alias cdp="cd /home/vrmaroli/monorepo/products/"

# Kubernetes
alias k="kubectl"

# Bash complete aliases
source ~/bash_completion.sh
complete -F _complete_alias k
