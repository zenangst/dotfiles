function oco
	open-controller $argv
end
function open-controller
	set base_dir (git rev-parse --show-toplevel )"/app/controllers"
	if test (echo $argv | wc -w) -eq 1
		set first_grep $argv
	else
		set first_grep $argv[1]
	end
	if ls $base_dir | grep -i $first_grep > /dev/null 
		if test (ls $base_dir | grep -c $first_grep) -eq 1
			set target $base_dir"/"(ls $base_dir | grep -i $first_grep)
			if test (echo $argv | wc -w) -eq 1
				open -a "Coda 2" $target
			else
				set target_dir (ls -R $base_dir | grep -i $argv[1] | grep -i '/' | sed 's/://g')
				set targets (ls $target_dir | grep -i $argv[2])
				for target in $targets
					open -a "Coda 2" $target_dir"/"$target
				end
			end
		else
			if test (echo $argv | wc -w) -eq 1
				set targets $base_dir"/"(ls $base_dir | grep -i $first_grep | grep -i '.rb')
				for target in $targets
					open -a "Coda 2" "$target"
				end
			else
				set target_dir (ls $base_dir | grep -i $argv[1] | grep -i '/' | sed 's/://g')
				set targets $base_dir"/"(ls $base_dir | grep -i $argv[2] | grep -i '.rb')
				for target in $targets
					open -a "Coda 2" $target
				end
			end
		end
	end
end