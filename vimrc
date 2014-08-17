set nocompatible
set ttyfast
set lazyredraw

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

" Remap leader to ",".
let mapleader = ","

" Keep 1000 commands worth of history.
set history=1000

" Allow 1000 levels of undo.
set undolevels=1000

" Ignore some files when autocompleting.
set wildignore=*.swp,*.pyc,*.class

" Change the terminal's title.
set title

" Don't create backup or swap files.
set nobackup
set noswapfile

" Maintain at least 3 lines worth of context around the cursor.
set scrolloff=3

" Show line numbers
set nonumber

" Set color scheme
set t_Co=256
colorscheme zenangst

" Enable syntax highlighting
syntax on

" Load plugins and indentation preferences based on file type.
filetype on
filetype plugin on
filetype indent on

" Initialize pathogen.
call pathogen#infect()

" Quickly edit and source ~/.vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC

" Allow opening new files without writing changes first.
set hidden

" Wrap lines.
set wrap
set linebreak
set breakindent

" A tab is 2 spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Round indentation to multiples of shiftwidth when indenting.
set shiftround

" Enable automatic indentation.
set autoindent
set copyindent

" Show search matches as you type.
set incsearch
set hlsearch

" Set default encoding
set encoding=utf-8

" Disable the arrow keys. You'll thank me later.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Display a list of completion alternatives.
set wildmenu

" Allow deleting anything with backspace.
set backspace=indent,eol,start

" Always show the status line.
set laststatus=2

" Customize the status line
set statusline=%f\ (%{&fenc})%=\ %l/%L

" Trim whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Copy gist URL to clipboard
let g:gist_clip_command = 'pbcopy'

" Detect the gist filetype from the filename
let g:gist_detect_filetype = 1

" Don't highlight Git gutter's sign column
highlight clear SignColumn

" Always show Git gutter
let g:gitgutter_sign_column_always = 1

" Create directories upon writing buffers if needed
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" ctrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-multi-cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" clang

"SuperTab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"


" Syntax customizations
let is_posix=1
let c_gnu=1
let c_space_errors=1
let c_no_bracket_error=1
let c_no_curly_error = 1
let objc_syntax_for_h=1
let filetype_m='objc'
set cinoptions=g1,h3,t0,(0,W4

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType m setlocal omnifunc=cocoacomplete#Complete
autocmd FileType mm setlocal omnifunc=cocoacomplete#Complete
autocmd FileType h  setlocal omnifunc=cocoacomplete#Complete

set clipboard+=unnamed
set splitbelow
set splitright

let g:acp_behaviorKeywordLength = 2

:nnoremap <C-x> :bnext<CR>
":nnoremap <C-w> <up>
":nnoremap <C-a> <left>
":nnoremap <C-d> <right>
":nnoremap <C-s> <down>
:map! <C-w> <up>
:map! <C-a> <left>
:map! <C-d> <right>
:map! <C-s> <down>

:map! Ω <up>
:map!  <left>
:map! ∂ <right>
:map! ß <down>

command! W :w

if has("mouse")
    set mouse=a
endif

" clang
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 1
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_exec = '/Library/Developer/CommandLineTools/usr/bin/clang'
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
let g:clang_debug = 1
"let g:clang_exec = '/usr/bin/clang'
let g:clang_user_options='|| exit 0'
let g:clang_complete_copen = 1

" " Read the clang complete file
"let g:syntastic_objc_config_file = '.clang_complete'
"
" " Status line configuration
let g:syntastic_enable_signs=0  " Show sidebar signs.
let g:syntastic_objc_config_file = '.syntastic_complete'
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <silent> ` :Errors<CR>

"set verbosefile=~/.log/vim/verbose.log
"set verbose=15

let g:delimitMate_expand_cr = 1
