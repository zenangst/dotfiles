if has("autocmd")

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
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType m setlocal  omnifunc=syntaxcomplete#Complete
    autocmd FileType mm setlocal omnifunc=syntaxcomplete#Complete
    autocmd FileType h  setlocal omnifunc=syntaxcomplete#Complete
    autocmd BufRead,BufNewFile *.m,*.h,*.mm,*.pch setf objc
    :au InsertEnter *.potl if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    :au InsertLeave,WinLeave *.potl if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    "autocmd BufWinEnter * :call SetGitDir()
    au CursorHold * checktime
    " augroup CursorLine
    "     au!
    "     au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "     au WinLeave * setlocal nocursorline
    " augroup END
    "au TabEnter * let &lines = 100
    "au InsertLeave * normal! l
endif


