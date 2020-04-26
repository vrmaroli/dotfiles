#!/bin/bash

__kube_ps1()
{
    # Get current context
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
    NAMESPACE=$(kubectl config view --minify | grep namespace: | sed "s/    namespace: //")
    if [[ -n "$CONTEXT" && -n "$NAMESPACE" ]]; then
        echo "(k8s: ${CONTEXT} [${NAMESPACE}])"
    elif [[ -n "$CONTEXT" ]]; then
        echo "(k8s: ${CONTEXT} [])"
    fi
}

# prompt colors
export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__kube_ps1)${NORMAL} \$ "

# Get current context
alias krc='kubectl config current-context'
# List all contexts
alias klc='kubectl config get-contexts -o name | sed "s/^/  /;\|^  $(krc)$|s/ /*/"'
# Change current context
alias kcc='kubectl config use-context "$(klc | fzf -e | sed "s/^..//")"'

# Get current namespace
alias krn='kubectl config get-contexts --no-headers "$(krc)" | awk "{print \$5}" | sed "s/^$/default/"'
# List all namespaces
alias kln='kubectl get -o name ns | sed "s|^.*/|  |;\|^  $(krn)$|s/ /*/"'
# Change current namespace
alias kcn='kubectl config set-context --current --namespace "$(kln | fzf -e | sed "s/^..//")"'
