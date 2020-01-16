call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

" Autosave every 1 sec: https://vi.stackexchange.com/a/79
autocmd CursorHold * update
set updatetime=1000

" Don't create swapfiles
set noswapfile
