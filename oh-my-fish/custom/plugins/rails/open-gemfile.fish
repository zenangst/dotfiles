function og
	open-gemfile
end
function open-gemfile
	set target (git rev-parse --show-toplevel)"/Gemfile"
	open -a "Coda 2" $target
end