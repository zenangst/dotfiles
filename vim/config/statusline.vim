set laststatus=0
set statusline=
set statusline+=%1*\ %y\                                  "FileType
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%4*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

