function vagrant_state() {
  if [[ -e Vagrantfile ]]; then
    v_stat=`vagrant status 2>/dev/null | grep default | awk '{print $2}'`
  fi
  echo $v_stat
}

