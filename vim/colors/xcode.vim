"
" Vim colour file
"
" Maintainer:  Christoffer Winterkvist <christoffer@winterkvist.com>
" Last Change: 30 August 2014
" Version:     1.0
"
" This colour file is meant for GUI use.
"

set background=light
set transparency=0
set guifont=Bitstream\ Vera\ Sans\ Mono:h12

hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="xcode"


hi Normal        guifg=black  guibg=white
hi Title         guifg=black    guibg=white
hi Cursor        guibg=#2E72D1
hi LineNr        guifg=#aaaaaa  guibg=#f8f8f8
hi SignColumn    guifg=#aaaaaa  guibg=#f8f8f8
"hi SignColumn    guifg=#aaaaaa  guibg=#EDF5FF
"hi SignColumn    guibg=white
hi Visual        guibg=#bbddff
hi NonText       guifg=#ffffff  guibg=#ffffff
hi StatusLine    guifg=#222222  guibg=#EDF5FF  gui=none
hi StatusLineNC  guifg=#666666  guibg=#EDF5FF  gui=none
hi VertSplit     guifg=#eeeeee  guibg=#eeeeee  gui=none
hi ModeMsg       guifg=#007050  guibg=#eeeeee  gui=none
hi ErrorMsg      guifg=#f03050  guibg=#eeeeee  gui=none
hi Error         guifg=#bb3355  guibg=white    gui=none
hi Folded        guifg=#888888  guibg=#FBFAE9

hi GitGutterAddLine          guibg=#ebffe9
hi GitGutterChangeLine       guibg=#fffed8
hi GitGutterDeleteLine       guibg=#feedee
hi GitGutterChangeDeleteLine guibg=#ecf8ff

" Vim 7.x specific
if version >= 700
  hi CursorLine  guibg=#eeeeee  gui=none
  hi MatchParen  guibg=#ccffdd  gui=none
  hi Pmenu       guifg=#60656f  guibg=#f0f5ff  gui=none
  hi PmenuSel    guifg=white    guibg=#3585ef  gui=bold
  hi PmenuSbar   guifg=#d0d5dd  guibg=#e0e5ee  gui=bold
  hi PmenuThumb  guifg=#e0e5ee  guibg=#c0c5dd  gui=bold
  hi Search      guibg=#fcfcaa  gui=none
  hi IncSearch   guibg=#ffff33  gui=bold
endif


" Syntax highlighting
hi Comment       guifg=#167300  gui=none
"hi Todo         guifg=#225522  guibg=white    gui=italic
hi Todo          guifg=#6CBE41  guibg=#D8F6C0  gui=italic
hi Operator      guifg=#232323  gui=none
hi Identifier    guifg=#1a1a1a  gui=none
hi Statement     guifg=#3B4E6B  gui=none
hi Type          guifg=#598D38  gui=none
hi Constant      guifg=#291261  gui=none
hi Conditional   guifg=#107D52  gui=none
hi Delimiter     guifg=#1a1a1a  gui=none
hi PreProc       guifg=#62381e  gui=none
hi Special       guifg=#127BB9  gui=none
hi Keyword       guifg=#007050  gui=none
hi Function      guifg=#204A87
hi Number        guifg=#127BB9
hi String        guifg=#C41A15

"hi link Function        Normal
hi link Character       Constant
"hi link String          Constant
hi link Boolean         Constant
"hi link Number          Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

hi User1 guifg=#999999  guibg=#eeeeee
hi User2 guifg=#999999  guibg=#e0e0e0
hi User3 guifg=#999999  guibg=#dddddd
hi User4 guifg=#999999  guibg=#d0d0d0


