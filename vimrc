source ~/.vim/vimrc
execute pathogen#infect('bundle/{}', '~/src/env/vimbundle/{}')

set ts=2
set cindent shiftwidth=2

map <Up> gk
imap <Up> <C-o>gk
map <Down> gj
imap <Down> <C-o>gj

set showbreak=
set nohlsearch
set display=lastline

map <F4> :set number!<CR>
map <S-F4> :set relativenumber!<CR>

set t_Co=256
syntax enable
set background=dark
colorscheme solarized

hi normal ctermbg=none
map <F12> :hi normal ctermbg=none<CR>
map <S-F12> :hi normal ctermbg=black<CR>

" sudo write
ca w!! w !sudo tee >/dev/null "%"

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

