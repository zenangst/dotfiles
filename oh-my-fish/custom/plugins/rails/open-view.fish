function ov
	open-view $argv
end
function open-view
	set base_dir (git rev-parse --show-toplevel )"/app/views"
	if test (echo $argv | wc -w) -eq 1
		set first_grep $argv
	else
		set first_grep $argv[1]
	end
	
	if ls $base_dir | grep -i $first_grep > /dev/null 
		if test (ls $base_dir | grep -c $first_grep) -eq 1
			set target_dir $base_dir"/"(ls $base_dir | grep -i $first_grep)
			if test (echo $argv | wc -w) -eq 1
				ls $target_dir | awk -v s="$target_dir" '{ printf "\"%s/%s\"\n",s,$1 }' | xargs open -a "/Applications/Coda 2.app"
			else
				ls $target_dir | grep -i $argv[2] | awk -v s="$target_dir" '{ printf "\"%s/%s\"\n",s,$1 }' | xargs open -a "/Applications/Coda 2.app"
			end
		else
			set target_dir (ls -R $base_dir | grep -i att | grep -i '/' | sed 's/://g') 
			for path in $target_dir
				if test (echo $argv | wc -w) -eq 1
					set files (ls $path | awk -v s="$path" '{ printf "%s/%s\n",s,$1}')
					for file in $files
						open -a "Coda 2" "$file"
					end
				else
					set files (ls $path | grep -i $argv[2] | awk -v s="$path" '{ printf "\%s/%s\n",s,$1}')
					for file in $files
						open -a "Coda 2" "$file"
					end
				end
			end
		end
	end
end