colorscheme mix
set go-=T
set bg=light
set transp=0
if &background == "dark"
    hi normal guibg=black
endif
set showtabline=2
set guioptions=gmeT
set shortmess=aT
set guifont=Menlo h:12
set noshowmode

highlight clear SignColumn

" GitGutter
hi GitGutterAdd    guifg=#009900 guibg=#ecfeed
hi GitGutterChange guifg=#111111 guibg=#fed200
hi GitGutterDelete guifg=#e92516 guibg=#feecec
hi GitGutterChangeDelete guifg=#683f32 guibg=#f7eed5

autocmd! GUIEnter * set vb t_vb=

set guicursor=n-c:ver10-Cursor-blinkon0
set guicursor+=v:ver10-vCursor
set guicursor+=ve:ver10-Cursor
set guicursor+=o:hor50-Cursor-blinkwait2-blinkoff150-blinkon2
set guicursor+=i-ci:ver15-iCursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkon200

set titlestring=%t
