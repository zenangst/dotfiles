function! s:GotoNextWindow( direction, count )
    let l:prevWinNr = winnr()
    execute a:count . 'wincmd' a:direction
    return winnr() != l:prevWinNr
endfunction

" Add wrapping to cycling windows
function! s:JumpWithWrap( direction, opposite )
    if ! s:GotoNextWindow(a:direction, v:count1)
        call s:GotoNextWindow(a:opposite, 999)
    endif
endfunction

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

let g:loaded_alt_mappings = 1

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

" GitGutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

:nnoremap <D-A> :silent GitGutterLineHighlightsToggle<CR>
:map <D-A> :silent GitGutterLineHighlightsToggle<CR>
:vnoremap <D-A> :silent GitGutterLineHighlightsToggle<CR>
:inoremap <D-A> :silent GitGutterLineHighlightsToggle<CR>

:nnoremap <D-d> :silent GitGutterNextHunk<CR>
:nnoremap <D-D> :silent GitGutterPrevHunk<CR>
:map! <D-d> <esc>:silent GitGutterNextHunk<CR>
:map! <D-D> <esc>:silent GitGutterPrevHunk<CR>

" Navigate Windows
:nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
:nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
:nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
:nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

:nnoremap <silent> <C-h> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
:nnoremap <silent> <C-j> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
:nnoremap <silent> <C-k> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
:nnoremap <silent> <C-l> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

:nnoremap <silent> ‹ :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
:nnoremap <silent> « :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
:nnoremap <silent> ç :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
:nnoremap <silent> Ç :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>

:map! <silent> ‹ <esc>:<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
:map! <silent> « <esc>:<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
:map! <silent> ç <esc>:<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
:map! <silent> Ç <esc>:<C-u>call <SID>JumpWithWrap('k', 'j')<CR>

" Split Window
:map! <D-S> <ESC>:split<CR>
:nnoremap <D-S> :split<CR>
:map! <C-v> <ESC>:vsplit<CR>
:nnoremap <C-v> :vsplit<CR>

" Open in New Window
:map <D-N> <esc>:silent !mvim -f "%" & <CR>
:nnoremap <D-N> :silent !mvim -f "%" &<CR>
:inoremap <D-N> <esc>:silent !mvim -f "%" & <CR>

" Select words
:nnoremap <C-w> gkviw
:map! <C-w> <esc>gkviw
:vmap <C-w> <esc>gkbviw

:nnoremap <C-d> viw
:map! <C-d> <esc>viw
:vmap <C-d> <esc>wviw

:nnoremap <C-a> <left>bviw
:map! <C-a> <esc>viw
:vmap <C-a> <esc>b<left>bviw

:nnoremap <C-s> gjviw
:map! <C-s> <esc>gjviw
:vmap <C-s> <esc>bgjviw

:nnoremap ® A
:inoremap ® <ESC>A
:inoremap √ <ESC>0i

" Navigation (Left hand)
:nnoremap Ω gk
:nnoremap  <left>
:nnoremap ∂ <right>
:nnoremap ß gj
:map! Ω <up>
:map!  <left>
:map! ∂ <right>
:map! ß <down>
:map! ® <ESC>A
:map! √ <ESC>0i
:inoremap <expr> Ω pumvisible() ? "\<up>" : "\<esc>gkil"
:inoremap  <left>
:inoremap ∂ <right>
:inoremap <expr> ß pumvisible() ? "\<down>" : "\<esc>gjil"
:vmap Ω <up>
:vmap  <left>
:vmap ∂ <right>
:vmap ß <down>

" Naviation (Right hand)
:nnoremap π gk
:nnoremap ﬁ <left>
:nnoremap æ <right>
:nnoremap ø gj
:map! π <up>
:map! ﬁ <left>
:map! æ <right>
:map! ø <down>
:inoremap <expr>π pumvisible() ? "\<up>" : "\<esc>gkil"
:inoremap ﬁ <left>
:inoremap æ <right>
:inoremap <expr>ø pumvisible() ? "\<down>" : "\<esc>gjil"
:vmap ˝ <up>
:vmap π <up>
:vmap ﬁ <left>
:vmap æ <right>
:vmap ø <down>
:vmap ∑ <down>

" Switch modes
:inoremap … <ESC>
:nnoremap … i

" Delete line(s)
:noremap <C-K> dd
:vnoremap <C-K> d

" Duplicate line(s)
" :noremap <C-D> yP
" :vnoremap <C-D> yP

:nnoremap ≈ i<bs>
:inoremap ≈ <bs>

:nnoremap ˇ i<del>
:inoremap ˇ <del>

:vnoremap ≈ x

" Select line(s)
:nnoremap <D-L> V
:vnoremap <D-L> V
:inoremap <D-L> <esc>V

:nnoremap <silent> <D-M-CR> A;
:nnoremap <D-C> :A<cr>
:noremap <D-F> :OverCommandLine<cr>

" Switching Buffers
:nnoremap ≥ :silent bprev<CR>
:nnoremap ≤ :silent bnext<CR>
:nnoremap ˝ :silent bd<CR>

" Quickly edit and source ~/.vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC

" Remap to <leader>g for easy use
nnoremap <leader>g :call SetGitDir()<CR>

" LimeLight
nnoremap ◊ :call ToggleLimeLight()<CR>

" Errors
nnoremap <silent> ` :Errors<CR>

" completions
inoremap <expr> <C-space> "\<C-x>\<C-u>"
inoremap <expr>  pumvisible()      ? "\<C-n>" : "\<C-x>\<C-n>\<C-n>"
inoremap <expr> <d-cr> pumvisible()    ? "\<C-n>" : "\<C-x>\<C-n>\<C-n>"
inoremap <expr> <BS> pumvisible() ? "\<esc>i\<right>\<BS>" : "\<BS>"

" neocomplete
inoremap <expr> <C-r> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <D-3>     <Plug>(neosnippet_expand_or_jump)
smap <D-3>  <Plug>(neosnippet_expand_or_jump)
xmap <D-3>  <Plug>(neosnippet_expand_target)

" Commentary
vnoremap <D-/> :Commentary<cr>
nnoremap <D-/> :Commentary<cr>

" vim-multiple-cursors
vnoremap <D-›> :<C-U>call multiple_cursors#new("v")<CR>

" peepopen
map <D-O> <Plug>PeepOpen
inoremap <D-O> <Plug>PeepOpen
"vnoremap <D-O> <esc><Plug>PeepOpen

" vim-expand-region
"map <d-b> <Plug>(expand_region_expand)
"map <d-B> <Plug>(expand_region_shrink)

" vim-interestingwords
nnoremap <D-’> :call UncolorAllWords()<cr>
nnoremap m :call InterestingWords()<cr>
nnoremap <silent> <leader>k :call InterestingWords()<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
