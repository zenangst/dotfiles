function oc
	open-commit $argv
end
function open-commit
	#--word-diff=color
	set git_root (git rev-parse --show-toplevel)
	#git --no-pager show $argv
	set collection (git --no-pager show --name-only --oneline $argv | sed 1d )
	for file in $collection
    open -a "Coda 2" "$git_root/$file"
	end
end