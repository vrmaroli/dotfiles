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
