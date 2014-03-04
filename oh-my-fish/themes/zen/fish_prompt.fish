# Fish colors
set fish_color_normal 528
set fish_color_command A28
set fish_color_quote 693
set fish_color_cwd 08B
set fish_color_comment gray
set fish_color_param 06B
set fish_color_autosuggestion '555'  'yellow'

set fish_pager_color_prefix blue
set fish_pager_color_completion 969
set fish_pager_color_description blue
set fish_pager_color_progress blue
set fish_pager_color_prefix 969
set fish_pager_color_secondary 528

set fish_color_search_match --background=purple
set fish_color_valid_path --underline

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch 081

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

eval (direnv hook fish)

function fish_prompt
  set last_status $status
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s ' (__fish_git_prompt)
  set_color normal
  #~/.powerline-shell.py $status --shell bare ^/dev/null
end

set fish_greeting ""