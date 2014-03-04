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
set number

" Set color scheme
if has("gui_macvim")
  set go-=T
  set bg=dark
  colorscheme vylight
  set guioptions += e
  let g:toggleTabs = 1
  if &background == "dark"
    hi normal guibg=black
    set transp=8
  endif
else
  colorscheme jellybeans
endif

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

" Don't wrap lines.
set nowrap

" A tab is 2 spaces.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Round indentation to multiples of shiftwidth when indenting.
set shiftround

" Enable automatic indentation.
set autoindent
set copyindent

" Show search matches as you type.
set incsearch

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

" Use fancy powerline symbols
let g:Powerline_symbols = 'fancy'

" Copy gist URL to clipboard
let g:gist_clip_command = 'pbcopy'

" Detect the gist filetype from the filename
let g:gist_detect_filetype = 1

" Flush Command T upon writing to a file and gaining focus.
"augroup CommandTExtension
"  autocmd!
"  autocmd FocusGained * CommandTFlush
"  autocmd BufWritePost * CommandTFlush
"augroup END

" Navigate open buffers
nmap <Space> :e#<Return>

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
