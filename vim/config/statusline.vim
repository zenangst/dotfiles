set verbose=0
set cmdheight=2
set laststatus=1
set statusline=
set statusline+=*\ %y\                                  "FileType
set statusline+=*\ %<%F\                                "File+path
set statusline+=*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
 set statusline+=*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
 set statusline+=%#warningmsg#  " Add Error ruler.
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*



