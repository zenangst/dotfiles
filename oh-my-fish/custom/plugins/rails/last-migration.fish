function lm
	last-migration 
end
function last-migration
	set migrate_dir (git rev-parse --show-toplevel)"/db/migrate/"
	set target (ls $migrate_dir | tail -n1)
	open $migrate_dir$target
  #ls $migrate_dir | tail -n1 | xargs open -a \"Coda 2\"
end