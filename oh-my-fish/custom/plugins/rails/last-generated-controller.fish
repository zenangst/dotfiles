function lgc
	last-generated-controller $argv
end
function last-generated-controller
	set base_dir (git rev-parse --show-toplevel)"/app/test/controllers/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
  last-controller
end