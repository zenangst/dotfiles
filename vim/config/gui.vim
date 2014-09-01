colorscheme mix
set go-=T
set bg=light
set transp=0
if &background == "dark"
    hi normal guibg=black
    set transp=8
else
endif
set showtabline=2
set guioptions=gme
set shortmess=aT
set cmdheight=2
set guifont=Bitstream\ Vera\ Sans\ Mono\ h:11
set gcr=a:blinkon0
set noshowmode
highlight clear SignColumn

" GitGutter
hi GitGutterAdd    guifg=#009900 guibg=#ECFEED
hi GitGutterChange guifg=#111111 guibg=#FED200
hi GitGutterDelete guifg=#E92516 guibg=#FEECEC
hi GitGutterChangeDelete guifg=#683F32 guibg=#F7EED5

autocmd! GUIEnter * set vb t_vb=

