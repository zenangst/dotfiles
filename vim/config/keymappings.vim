let g:loaded_alt_mappings = 1

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

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

:map! <D-S> <ESC>:split<CR>
:nnoremap <D-S> :split<CR>
:map! <C-v> <ESC>:vsplit<CR>
:nnoremap <C-v> :vsplit<CR>

:map <D-N> <esc>:silent !mvim -f "%" & <CR>
:nnoremap <D-N> :silent !mvim -f "%" &<CR>
:inoremap <D-N> <esc>:silent !mvim -f "%" & <CR>

:map! <C-w> <up>
:map! <C-a> <left>
:map! <expr><C-d> neocomplete#close_popup()."\<right>"
:map! <C-s> <down>

:nnoremap <C-w> <esc><up>viw
:map! <C-w> <esc><up>viw
:vmap <C-w> <esc><up>bviw

:nnoremap <C-d> <esc>wviw
:map! <C-d> <esc>wviw
:vmap <C-d> <esc>wviw

:nnoremap <C-a> <esc>b<left>bviw
:map! <C-a> <esc>b<left>bviw
:vmap <C-a> <esc>b<left>bviw

:nnoremap <C-s> <esc><down>viw
:map! <C-s> <esc><down>viw
:vmap <C-s> <esc>b<down>viw

:nnoremap Ω <up>
:nnoremap  <left>
:nnoremap ∂ <right>
:nnoremap ß <down>
:nnoremap ® A

:map! Ω <up>
:map!  <left>
:map! ∂ <right>
:map! ß <down>
:map! ® <ESC>A

:inoremap Ω <ESC><up>
:inoremap  <ESC><left>
:inoremap ∂ <ESC><right><right>
:inoremap ß <ESC><down>
:inoremap ® <ESC>A

:vmap Ω <up>
:vmap  <left>
:vmap ∂ <right>
:vmap ß <down>

:nnoremap π <up>
:nnoremap ﬁ <left>
:nnoremap æ <right>
:nnoremap ø <down>

:inoremap … <ESC>
:nnoremap … i

:map! π <up>
:map! ﬁ <left>
:map! æ <right>
:map! ø <down>

:inoremap π <up>
:inoremap ﬁ <left>
:inoremap <expr>æ pumvisible() ? neocomplete#close_popup() : "\<right>"
:inoremap ø <down>

:vmap π <up>
:vmap ﬁ <left>
:vmap æ <right>
:vmap ø <down>

:nnoremap ◊ :silent GitGutterToggle<CR>
:nnoremap <D-d> :silent GitGutterNextHunk<CR>
:nnoremap <D-D> :silent GitGutterPrevHunk<CR>
:map! <D-d> <esc>:silent GitGutterNextHunk<CR>
:map! <D-D> <esc>:silent GitGutterPrevHunk<CR>
:nnoremap ≥ :silent bprev<CR>
:nnoremap ≤ :silent bnext<CR>
:nnoremap ˝ :silent bd<CR>

" Quickly edit and source ~/.vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC

" Remap to <leader>g for easy use
nnoremap <leader>g :call SetGitDir()<CR>

nnoremap <silent> ` :Errors<CR>
