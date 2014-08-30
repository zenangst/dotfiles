function blame
  git blame $argv > /tmp/git-blame.gitlog; and coda /tmp/git-blame.gitlog
end