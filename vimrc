source ~/.vim/vimrc

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

set t_Co=256
syntax enable
set background=dark
colorscheme solarized

hi normal ctermbg=none
map <F12> :hi normal ctermbg=none<CR>
map <S-F12> :hi normal ctermbg=black<CR>
