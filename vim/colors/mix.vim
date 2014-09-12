"
" Vim colour file
"
" Maintainer:  Christoffer Winterkvist <christoffer@winterkvist.com>
" Last Change: 30 August 2014
" Version:     1.0
"
" This colour file is meant for GUI use.
"

hi clear
if exists("syntax_on")
    syntax reset
endif
set background=light
set transparency=0
set guifont=Menlo:h12
let g:colors_name="mix"

hi Normal  guifg=#1a1a1a  guibg=white
hi Title   guifg=black
hi Cursor  guibg=black
"hi iCursor guibg=#f03050
hi iCursor guibg=#5281ff
hi vCursor

"hi iCursor       guibg=#
"hi LineNr        guifg=#aaaaaa  guibg=#f8f8f8
"hi SignColumn    guifg=#aaaaaa  guibg=#f8f8f8
hi LineNr        guifg=#aaaaaa  guibg=#ffffff
hi SignColumn    guifg=#aaaaaa  guibg=#ffffff
"hi SignColumn    guifg=#aaaaaa  guibg=#EDF5FF
"hi SignColumn    guibg=white
hi Visual        guibg=#bbddff
hi NonText       guifg=#ffffff  guibg=#ffffff
hi StatusLine    guifg=#a1882b  guibg=#ffefc6  gui=none
hi StatusLineNC  guifg=#4b86d7  guibg=#cfe0f8  gui=none
hi VertSplit     guifg=#eeeeee  guibg=#eeeeee  gui=none
hi ModeMsg       guifg=#007050  guibg=#eeeeee  gui=none
hi ErrorMsg      guifg=#f03050  guibg=#eeeeee  gui=none
hi Error         guifg=#bb3355  gui=bold
hi Folded        guifg=#888888  guibg=#fbfae9

hi GitGutterAddLine          guibg=#ebffe9
hi GitGutterChangeLine       guibg=#fffed8
hi GitGutterDeleteLine       guibg=#feedee
hi GitGutterChangeDeleteLine guibg=#ecf8ff

" Vim 7.x specific
if version >= 700
  hi CursorLine  guibg=#fdfde8  gui=none
  hi MatchParen  guibg=#ccffdd  gui=none
  hi Pmenu       guifg=#60656f  guibg=#eeeeee  gui=bold
"  hi Pmenu       guifg=#60656f  guibg=#f0f5ff  gui=none
  hi PmenuSel    guifg=white    guibg=#5281FF  gui=bold
"  hi PmenuSel    guifg=white    guibg=#3585ef  gui=bold
  hi PmenuSbar   guifg=#d0d5dd  guibg=#F5F5F5  gui=bold
 "" hi PmenuSbar   guifg=#d0d5dd  guibg=#e0e5ee  gui=bold
  hi PmenuThumb  guifg=#e0e5ee  guibg=#e0e5ee  gui=bold
  hi Search      guibg=#fcfcaa  gui=bold
  hi IncSearch   guibg=#ffff33  gui=bold
endif

" Syntax highlighting
hi Comment       guifg=#878787  guibg=#f9f9f9 gui=none
"hi Todo         guifg=#225522  guibg=white    gui=italic
hi Todo          guifg=#6cbe41  guibg=#d8f6c0  gui=italic
hi Operator      guifg=#232323  gui=none
hi Identifier    guifg=#1a1a1a  gui=none
"hi Statement     guifg=#3B4E6B  gui=none
hi Statement     guifg=#3e6196  gui=none
hi Type          guifg=#598D38  guibg=#d8f6c0 gui=none
hi Constant      guifg=#a1882b  guibg=#ffefc6 gui=none
hi Conditional   guifg=#107d52  gui=none
hi Delimiter     guifg=#1a1a1a  gui=none
hi PreProc       guifg=#007050  guibg=#D8F6C0 gui=none
hi Special       guifg=#127bb9  gui=none
hi Keyword       guifg=#007050  gui=none
hi Function      guifg=#204a87
"hi Number       guifg=#127BB9
hi Number        guifg=#de7a31  guibg=#fefcf6
hi String        guifg=#b9671c  guibg=#fefcf6

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
hi link StorageClass    Constant
hi link Structure       Keyword
hi link Typedef         Constant
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

hi User1 guifg=#999999  guibg=#eeeeee
hi User2 guifg=#999999  guibg=#e0e0e0
hi User3 guifg=#999999  guibg=#dddddd
hi User4 guifg=#999999  guibg=#d0d0d0

let g:interestingWordsGUIColors = ['#eff8ff', '#d1ebff', '#b3ddff', '#d9f0cb', '#c8e8b4', '#a6d687', '#f9f2ba', '#f6ec9d', '#f2e581', '#f5d2fc', '#eeb8f9', '#e084f1', '#f4b9bf', '#ef9fa7', '#e9868f']
