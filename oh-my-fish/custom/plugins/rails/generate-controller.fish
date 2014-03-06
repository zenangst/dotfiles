function gc
	generate-controller $argv
end
function generate-controller
  rails generate controller $argv
  last-generated-controller
end