set nocompatible
set ttyfast
set autoread
"set lazyredraw
set scrolloff=10

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

" Set color scheme
set t_Co=256
set term=screen-256color
colorscheme zenangst

" Enable syntax highlighting
syntax on

" Load plugins and indentation preferences based on file type.
filetype on
filetype plugin on
filetype indent on

" Initialize pathogen.
call pathogen#infect()

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
set ic

" Set default encoding
set encoding=utf-8

" Display a list of completion alternatives.
set wildmenu

" Allow deleting anything with backspace.
set backspace=indent,eol,start

" No more cowbell
set noerrorbells
set novisualbell
set t_vb=

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set nocursorline

set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt+=longest
set clipboard+=unnamed
set splitbelow
set splitright

source ~/.vim/config/functions.vim
source ~/.vim/config/keymappings.vim
source ~/.vim/config/plugin_settings.vim
source ~/.vim/config/autocommands.vim
source ~/.vim/config/syntax.vim
source ~/.vim/config/statusline.vim

command! W :w

if has("mouse")
    set mouse=a
endif

"set verbosefile=~/.log/vim/verbose.log
"set verbose=15

set viminfo+=n/Users/christofferwinterkvist/Dropbox/com~apple~CloudDocs/dotfiles/viminfo
set foldlevelstart=20

set virtualedit=onemore
set whichwrap+=<,>,h,l,[,]

set exrc
set secure

if has("gui_running")
    source ~/.vim/config/gui.vim
endif
