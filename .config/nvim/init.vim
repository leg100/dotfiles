call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'SirVer/ultisnips'
Plug 'sebdah/vim-delve'
Plug 'justinmk/vim-dirvish'
Plug 'fatih/vim-go'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

iabbrev ccopy Copyright 2020 Louis Garman, all rights reserved.
iabbrev @@ louisgarman@gmail.com
iabbrev ssig -- <cr>Louis Garman<cr>louisgarman@gmail.com

" Leader key
let mapleader = ","

set nocompatible                " Enables us Vim specific features
set background=light
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set mouse=n                     " Enable mouse support in normal mode
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autowrite                   " Autosaves upon calling commands like :make
set noswapfile                  " Don't create swapfiles
set autoindent                  " Maintain indent after newline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set noshowmode                  " Lightline already shows mode in status line
set noshowmatch                 " Do not show matching brackets by flickering
set lazyredraw
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set cmdheight=2                 " Give more space for displaying messages.
set textwidth=80                " Wrap text after 80 columns
set formatoptions+=a            " Wrap and re-flow comments
set expandtab                   " Expand tabs into spaces
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4                   " 1 tab == 4 spaces
set matchtime=3                 " Highlight matching parenthesis after 300ms
set number                      " Show line number of cursor
set relativenumber              " Show line numbers relative to cursor
set hidden                      " Don't prompt to save buffer
set updatetime=300              " Suggested by coc.nvim
set shortmess+=c                " Suggested by coc.nvim

colorscheme solarized

augroup linenumbers
	autocmd!
    " Don't show line numbers in terminal mode
	autocmd TermOpen * setlocal nonumber norelativenumber
    " don't show line numbers in dirvish file viewer
    autocmd FileType dirvish setlocal nonumber norelativenumber
augroup END

" Double-tap escape to unhighlight search terms
nnoremap <silent> <esc><esc> :nohlsearch<cr>
" Map shortcuts for switching window panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Map shortcut to edit vim config
nnoremap <leader>e :edit $MYVIMRC<cr>
" Map shortcut to source current file
nnoremap <leader>s :source %<cr>
" Escape key exits terminal mode, or exits fuzzyfinder popup in terminal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" Page up/down exits terminal mode and scrolls up/down
tnoremap <PageUp> <c-\><c-n><PageUp>
tnoremap <PageDown> <c-\><c-n><PageDown>
" Map spacebar to visually select a word
nnoremap <space> viw
" Map _ to move current line up one line
nnoremap _ ddkkp
" Map shortcuts for switching panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Map shortcut to save file
nnoremap <leader>w :write<cr>

"
" Fuzzyfinder (FZF)
"

" Map Ctrl-P to list files, and in dirvish file viewer
nnoremap <c-p> :FZF<cr>
augroup fzf
    autocmd!
    autocmd FileType dirvish nunmap <c-p>
    " Map Ctrl-P in dirvish to list files in FZF
    autocmd FileType dirvish nnoremap <c-p> :FZF<cr>
augroup END
" Map Ctrl-B to list buffers
nnoremap <c-b> :Buffers<cr>

"
" CoC
"

" Map shortcuts to coc lsp funcs
nmap gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-fix-current)
nmap <silent> <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

"
" vim-go
"

" Disable all autocompletion
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_imports_autosave = 1
let g:go_gopls_enabled = 0

augroup go
	autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <leader>f  <Plug>(go-test-func)
	autocmd FileType go nmap <leader>a  :GoAlternate<cr>
augroup END

augroup yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
augroup END

augroup shellz
    autocmd!
    autocmd FileType sh setlocal tabstop=4 shiftwidth=4 sts=4
augroup END

let g:ackprg = 'ag --vimgrep'	" Use ag instead of ack with ack.vim plugin
