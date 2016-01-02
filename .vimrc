execute pathogen#infect()
syntax on
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim

set nocompatible
set modelines=0

set go-=T
set go-=L
set go-=r
set go-=m

"colors gruvbox
"set background=dark
colors jellybeans

nnoremap / /\v
vnoremap / /\v

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set relativenumber
set gdefault

" For vim-airlne to appear.
set laststatus=2
" For vim-airline to not display the mode.
set noshowmode

set backupdir=~/tmp,.
set directory=~/tmp,.

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=tab:▸\ ,eol:¬

" This works in my Linux, but I always need to change this in my Mac laps.
" There should be a way to detect the OS in here.
"set guifont=Input\ Mono\ Light\ 8
" For my macs
set guifont=InputMono\ Thin:h11
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
nnoremap <leader>gv :Gstatus<cr>
nnoremap <leader>gt :Gpush origin master<cr>
nnoremap <leader>c :CalendarH<cr>
" Sometimes goyo makes the cursor dissapear (MacVim)
nnoremap <leader>s :Scratch<cr>:Goyo<cr>
" navigate syntastic errors
nnoremap <leader>] :lnext<cr>
nnoremap <leader>[ :lprev<cr>
" Activates spelling in vim
nnoremap <leader>e :setlocal spell spelllang=en_us<cr>

" I'll probably need to move this to a session
" ... and they didn't work
" They worked, I needed topress R
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

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
" I don't want the error window to open.
let g:syntastic_auto_loc_list = 0
" Signs for the warning an error
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = "»"
" No balloons, command window is enough
let g:syntastic_enable_balloons = 0
" My only checker.
let g:syntastic_javascript_checkers = ['eslint']
let syntastic_stl_format = '[%e:%w]'

" a single line for division
set fillchars=vert:│

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,html.handlebars,html.mustache EmmetInstall
let g:user_emmet_leader_key='<C-E>'

" Disabling the arrow keys: Several people mention that it's a good thing to
" try.
" The only issue I have with this is that the autocomplete doesn't let me
" select the word because I can switch through the options :-(
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

let g:airline_powerline_fonts = 1
let g:vim_json_syntax_conceal = 0

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME."/Documents/code/snippets"]
