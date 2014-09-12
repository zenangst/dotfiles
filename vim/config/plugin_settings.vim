" Gist
let g:gist_post_private = 1

" Copy gist URL to clipboard
let g:gist_clip_command = 'pbcopy'

" Detect the gist filetype from the filename
let g:gist_detect_filetype = 1

" ctrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-multi-cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" SuperTab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"

" neocomplete
let g:acp_enableAtStartup = 1
let g:neocomplete#data_directory = "/Users/christofferwinterkvist/Dropbox/com~apple~CloudDocs/dotfiles/vim/cache/neocomplete"
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_prefetch = 1
let g:neocomplete#max_list = 15
let g:neocomplete#use_vimproc=1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c      = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp    = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objc   = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_overwrite_completefunc = 1

let g:neocomplete#sources._ = ['buffer']
let g:neocomplete#sources.objc = ['_']

imap <expr> <CR> pumvisible()
                     \ ? "\<C-Y>"
                     \ : "<Plug>delimitMateCR"
"inoremap <expr><C-Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><TAB>  pumvisible() ? neocomplete#close_popup() : "\<TAB>"

let g:marching_enable_neocomplete = 1

" neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

let g:neosnippet#snippets_directory='~/.vim/bundle/zen-snippets.vim/snippets'

" clang
"set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!

let g:clang_auto_select=1
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" gitgutter
highlight clear SignColumn

let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_signs = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_modified_removed = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'

" delimitMate
let g:delimitMate_expand_cr = 1

" session
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 2
let g:session_default_to_last = 1
let g:session_verbose_messages = 0
set sessionoptions-=help

" CoVim
let CoVim_default_name = "chrisw"
let CoVim_default_port = "22"

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_objc_config_file = '.clang_complete'
let g:syntastic_objc_check_header = 1
let g:syntastic_objc_no_include_search = 1
let g:syntastic_objc_no_default_include_dirs = 1
let g:syntastic_objc_auto_refresh_includes = 1
let g:syntastic_objc_compiler = 'clang'

" Status line configuration
 set statusline+=%#warningmsg#  " Add Error ruler.
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
nnoremap <silent> ` :Errors<CR>

" LimeLight
if has("gui_running")
    set g:limelight_default_coefficient = 0.4
endif

" Ag
let g:aghighlight=1
let g:ag_lhandler="topleft lopen"

" rainbow
au VimEnter * RainbowParenthesesToggle
au BufWinEnter * RainbowParenthesesLoadRound
au BufWinEnter * RainbowParenthesesLoadSquare
au BufWinEnter * RainbowParenthesesLoadBraces

" localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
