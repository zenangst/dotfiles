function root
  set git_root (git rev-parse --show-toplevel)
  cd $git_root
end
