execute pathogen#infect()
syntax on
filetype plugin indent on
set vb t_vb=

set nocompatible
set modelines=0

set go-=T
set go-=L
set go-=r
set go-=m

"set background=dark
colors jellybeans
"colors gruvbox
"colors seoul256

" Palenight configuration:
"set background=dark
"colorscheme palenight
let g:lightline.colorscheme = 'palenight'

" Italics for my favorite color scheme
" let g:palenight_terminal_italics=1

" End Palenight configuration.

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
"set macligatures
"set guifont=Fira\ Code\ Light:h12
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

nnoremap <leader><space> :Files<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>a :Rg
nnoremap <leader>gv :Gstatus<cr>
nnoremap <leader>gt :Gpush origin master<cr>
nnoremap <leader>c :CalendarH<cr>
" Sometimes goyo makes the cursor dissapear (MacVim)
nnoremap <leader>s :Scratch<cr>:Goyo<cr>
" Activates spelling in vim
nnoremap <leader>e :setlocal spell spelllang=en_us<cr>

" a single line for division
set fillchars=vert:│

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,html.handlebars,html.mustache,blade,vue EmmetInstall
let g:user_emmet_leader_key='<C-E>'

nnoremap j gj
nnoremap k gk

let g:airline_powerline_fonts = 1
let g:vim_json_syntax_conceal = 0

" nginx
au BufRead,BufNewFile */nginx/* if &ft == '' | setfiletype nginx | endif 

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:polyglot_disabled = ['jsx', 'cjsx']

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
