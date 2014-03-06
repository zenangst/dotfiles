function os
	open-session $argv
end

function open-session
	set git_root (git rev-parse --show-toplevel ) 
  set collection (git diff --name-only | sed "s/\.\.\///g" | sort -r ) 
  for file in $collection
    open -a "Coda 2" "$git_root/$file"
  end
end