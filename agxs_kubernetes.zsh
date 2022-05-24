function set_k8s_context() {
  if [[ -n "$1" ]]; then
    echo "$1" > $HOME/.kube/current-context
    kubectl config use-context "$1"
  else
    echo 'Context name required'
  fi
}

function unset_k8s_context() {
  if [[ -f "$HOME/.kube/current-context" ]]; then
    rm -f $HOME/.kube/current-context 1>/dev/null
    kubectl config unset current-context 1>/dev/null
  else
    echo "No context set"
  fi
}

function set_k8s_namespace() {
  if [[ -n "$1" ]]; then
    kubectl config set-context --current --namespace=$1
  fi
}
