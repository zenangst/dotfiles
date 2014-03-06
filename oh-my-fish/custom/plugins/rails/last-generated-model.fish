function lgm
	last-generated-model $argv
end
function last-generated-model
	set base_dir (git rev-parse --show-toplevel)"/spec/models/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
  last-model
end