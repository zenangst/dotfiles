function gm
	generate-migration $argv
end
function generate-migration
  rails generate migration $argv
  last-migration
end