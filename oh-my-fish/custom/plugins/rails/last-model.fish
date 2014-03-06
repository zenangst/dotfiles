function lmo
	last-model $argv
end
function last-model
	set base_dir (git rev-parse --show-toplevel)"/app/models/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
end