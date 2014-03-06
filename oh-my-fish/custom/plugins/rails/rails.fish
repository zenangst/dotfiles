function r
	if test (echo $argv | wc -w) -eq 1
		rails $argv
	end
end