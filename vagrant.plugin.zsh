function vagrant_state() {
  if [[ -e Vagrantfile ]]; then
    v_stat=`vagrant status 2>/dev/null | sed -n 3p | awk '{print $2}'`
  fi
  echo $v_stat
}

