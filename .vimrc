execute pathogen#infect()
syntax on
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim

set go-=T
set go-=L
set go-=r
set go-=m
"colors bluegreen
"colors molokai
"colors clouds-midnight
"colors solarized
"set background=dark " for solarized
colors jellybeans

nnoremap / /\v
vnoremap / /\v
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set relativenumber
set gdefault

set backupdir=~/tmp,.
set directory=~/tmp,.

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set guifont=Monospace\ 8
set ruler

"Searches
set incsearch
set showmatch
set ignorecase
set smartcase
set hlsearch
nnoremap <leader>/ :noh<cr>

" disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Losing focus will save the changes.
au FocusLost * :wa

"let g:mustache_abbreviations = 1

nnoremap <leader><space> :CtrlP<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>a :Ack 

" I'll probably need to move this to a session
" ... and they didn't work
let g:ctrlp_custom_ignore = {'dir': '\v[\/](node_modules|bower_components|build|release|vendor)\/*$'}
"set wildignore+=node_modules/*,bower_components/*,build/*,release/*,vendor/*

" For Ack to use the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"set autoindent