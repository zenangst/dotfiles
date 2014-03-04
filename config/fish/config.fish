set PATH /usr/local/git/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set EDITOR "xargs open -a \"Coda 2\""
set PKG_CONFIG_PATH = "/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

eval (direnv hook fish)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set fish_greeting ""
 
function fish_prompt
  set last_status $status
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

# Keyboard Shortcuts
function fish_default_key_bindings -d "Default (Emacs-like) key bindings for fish"
  # Clear earlier bindings, if any
  bind --erase --all
  
  # This is the default binding, i.e. the one used if no other binding matches
  bind "" self-insert
  
  bind \n execute
  
  bind \ck kill-line
  bind \cy yank
  bind \t complete
  
  bind \e\n "commandline -i \n"
  
  bind \e\[A up-or-search
  bind \e\[B down-or-search
  bind -k down down-or-search
  bind -k up up-or-search
  
  bind \e\[C forward-char
  bind \e\[D backward-char
  bind -k right forward-char
  bind -k left backward-char
  
  bind -k dc delete-char
  bind -k backspace backward-delete-char
  bind \x7f backward-delete-char
  
  bind \e\[H beginning-of-line
  bind \e\[F end-of-line
  
  # for PuTTY
  # https://github.com/fish-shell/fish-shell/issues/180
  bind \e\[1~ beginning-of-line
  bind \e\[3~ delete-char
  bind \e\[4~ end-of-line
  
  # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
  bind -k home beginning-of-line 2> /dev/null
  bind -k end end-of-line 2> /dev/null
  bind \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-delete
  
  bind \e\eOC nextd-or-forward-word
  bind \e\eOD prevd-or-backward-word
  bind \e\e\[C nextd-or-forward-word
  bind \e\e\[D prevd-or-backward-word
  bind \eO3C nextd-or-forward-word
  bind \eO3D prevd-or-backward-word
  bind \e\[3C nextd-or-forward-word
  bind \e\[3D prevd-or-backward-word
  bind \e\[1\;3C nextd-or-forward-word
  bind \e\[1\;3D prevd-or-backward-word
  
  bind \e\eOA history-token-search-backward
  bind \e\eOB history-token-search-forward
  bind \e\e\[A history-token-search-backward
  bind \e\e\[B history-token-search-forward
  bind \eO3A history-token-search-backward
  bind \eO3B history-token-search-forward
  bind \e\[3A history-token-search-backward
  bind \e\[3B history-token-search-forward
  bind \e\[1\;3A history-token-search-backward
  bind \e\[1\;3B history-token-search-forward
  
  bind \ca beginning-of-line
  bind \ce end-of-line
  bind \ey yank-pop
  bind \ch backward-delete-char
  bind \cw backward-kill-word
  bind \cp history-search-backward
  bind \cn history-search-forward
  bind \cf forward-char
  bind \cb backward-char
  bind \ct transpose-chars
  bind \et transpose-words
  bind \eu upcase-word
  # This clashes with __fish_list_current_token
  # bind \el downcase-word
  bind \ec capitalize-word
  bind \e\x7f backward-kill-word
  bind \eb backward-word
  bind \ef forward-word
  bind \e\[1\;5C forward-word
  bind \e\[1\;5D backward-word
  bind \e\[1\;9A history-token-search-backward # iTerm2
  bind \e\[1\;9B history-token-search-forward # iTerm2
  bind \e\[1\;9C forward-word #iTerm2
  bind \e\[1\;9D backward-word #iTerm2
  bind \ed forward-kill-word
  bind -k ppage beginning-of-history
  bind -k npage end-of-history
  bind \e\< beginning-of-buffer
  bind \e\> end-of-buffer
  
  bind \el __fish_list_current_token
  bind \ew 'set tok (commandline -pt); if test $tok[1]; echo; whatis $tok[1]; commandline -f repaint; end'
  bind \cl 'clear; commandline -f repaint'
  bind \cc 'commandline ""'
  bind \cu backward-kill-line
  bind \ed kill-word
  bind \cw backward-kill-path-component
  bind \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
  bind \cd delete-or-exit
  
  # Allow reading manpages by pressing F1
  bind -k f1 'man (basename (commandline -po; echo))[1] ^/dev/null; or echo -n \a'
  
  # This will make sure the output of the current command is paged using the less pager when you press Meta-p
  bind \ep '__fish_paginate'
  
  # term-specific special bindings
  switch "$TERM"
          case 'rxvt*'
                  bind \e\[8~ end-of-line
                  bind \eOc forward-word
                  bind \eOd backward-word
  end
  
  bind \n execute
  
  bind \ck kill-line
  bind \cy yank
  bind \t complete
  
  bind \qr beginning-of-line
  bind \cr end-of-line
  
  bind \cd forward-word
  bind \ca backward-word
  bind \cs history-search-forward
  bind \cw history-search-backward
  
  bind \cx kill-word

end

function gotoruby
  cd ~/Library/Mobile\ Documents/iCloud/Developer/Ruby/$argv
end

function cocoa
  cd ~/Library/Mobile\ Documents/iCloud/Developer/Cocoa/$argv
end

function ctouch
  cd ~/Library/Mobile\ Documents/iCloud/Developer/Cocoa\ Touch/$argv
end

function holte-code
  cd ~/Library/Mobile\ Documents/iCloud/Developer/Ruby/holte-code
end

function rehash
  . ~/.config/fish/config.fish
end

function iCloud
  cd ~/Library/Mobile\ Documents/iCloud
end

function sync
  /bin/sh ~/Library/Mobile\ Documents/iCloud/Developer/Configuration/OSX-Configuration/sync.sh $argv
end

function icloud
  /bin/sh ~/Library/Mobile\ Documents/iCloud/Developer/Configuration/OSX-Configuration/sync.sh $argv
end

function l
  ls -lah
end

# Start Postgres Server
function postgres_start
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
end

# Rails related functions

function _get_git_root
	git rev-parse --show-toplevel
end

function lm
	last-migration 
end
function last-migration
	set migrate_dir (git rev-parse --show-toplevel)"/db/migrate/"
	set target (ls $migrate_dir | tail -n1)
	open $migrate_dir$target
  #ls $migrate_dir | tail -n1 | xargs open -a \"Coda 2\"
end

function lc
	last-commit
end
function last-commit
  open-commit
end

function och
	git --no-pager show $argv
end

function oc
	open-commit $argv
end
function open-commit
	#--word-diff=color
	set git_root (git rev-parse --show-toplevel)
	#git --no-pager show $argv
	set collection (git --no-pager show --name-only --oneline $argv | sed 1d )
	for file in $collection
    open -a "Coda 2" "$git_root/$file"
	end

end

function och
  git --no-pager show $argv
end

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

function os
	open-session $argv
end

function osh
  git --no-pager diff
end

function open-session
	set git_root (git rev-parse --show-toplevel ) 
  set collection (git diff --name-only | sed "s/\.\.\///g" | sort -r ) 
  for file in $collection
    open -a "Coda 2" "$git_root/$file"
  end
end

function om
	open-model $argv
end

function open-model
	set base_dir (git rev-parse --show-toplevel )"/app/models"
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

function oa
	open-asset $argv
end
function open-asset
	set base_dir (git rev-parse --show-toplevel )"/app/assets"
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

function og
	open-gemfile
end
function open-gemfile
	set target (git rev-parse --show-toplevel)"/Gemfile"
	open -a "Coda 2" $target
end

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

function open-resource
  open-controller $argv
  open-model $argv
end

function lc
	last-controller $argv
end
function last-controller
	set base_dir (git rev-parse --show-toplevel)"/app/controllers/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
end

function lmo
	last-model $argv
end
function last-model
	set base_dir (git rev-parse --show-toplevel)"/app/models/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
end

function lr
	last-resource $argv
end
function last-resource
  last-model
  last-controller
end

function lgc
	last-generated-controller $argv
end
function last-generated-controller
	set base_dir (git rev-parse --show-toplevel)"/app/test/controllers/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
  last-controller
end

function lgm
	last-generated-model $argv
end
function last-generated-model
	set base_dir (git rev-parse --show-toplevel)"/spec/models/"
	set _file (ls -tr $base_dir | grep -i '.rb' | tail -n1)
	open -a "Coda 2" $base_dir$_file
  last-model
end

function gc
	generate-controller $argv
end
function generate-controller
  rails generate controller $argv
  last-generated-controller
end

function gmo
	generate-model $argv
end
function generate-model
  rails generate model $argv
  last-generated-model
end

function gm
	generate-migration $argv
end
function generate-migration
  rails generate migration $argv
  last-migration
end

function r
	if test (echo $argv | wc -w) -eq 1
		rails $argv
	end
end

function b
	bundle $argv
end

function be
  bundle exec $argv
end

function rails_server
  be rails server
end

function plist_refresh
	/usr/bin/killall -u $USER cfprefsd &
end

function heroku_run_with_exit
  set tmp_file "/tmp/heroku_deploy.log"
  heroku run -r $argv[1] "$argv[2]; echo \$?" > $tmp_file
  cat $tmp_file
  set exit_code (cat $tmp_file | tail -n 1)
  rm -f $tmp_file
  return $exit_code
end

function deploy
  if test (echo $argv | wc -w) -ge 1 
    set branch "master"
    set remote $argv[1]
  else
    set branch $argv[1]
    set remote $argv[2]
  end
  
  heroku maintenance:on -r $remote
  and git push $remote $branch:master
  
  if test $status -eq 0
    heroku_run_with_exit $remote "rake db:migrate"
    and heroku ps:restart -r $remote
    if test (which terminal-notifier | wc -l ) -eq 1
      terminal-notifier -title "Terminal" -subtitle "Heroku deployment" -message "Deployment was successful!" -activate 'com.apple.Terminal'
    else
      echo "Deployment was successful!"
    end
  else
    if test (which terminal-notifier | wc -l ) -eq 1
      terminal-notifier -title "Terminal" -subtitle "Heroku deployment" -message "Something went to shit" -activate 'com.apple.Terminal'
    else
      echo -e "\e[1;107;101m Deploy failed \e[0m"
    end
  end
  heroku maintenance:off -r $remote
end
