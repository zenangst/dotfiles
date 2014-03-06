function gmo
	generate-model $argv
end
function generate-model
  rails generate model $argv
  last-generated-model
end