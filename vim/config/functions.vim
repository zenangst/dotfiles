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

" Set current working directory to git root
function! SetGitDir()
    " Change working dir to the current file
    cd %:p:h
    " Set 'gitdir' to be the folder containing .git
    let gitdir=system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error. Let's cd
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
endfunction

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

function! ToggleLimeLight()
    if &background == 'light'
        let g:limelight_default_coefficient = 0.7
    else
        let g:limelight_default_coefficient = 0.4
    endif
    Limelight!!
endfunction
