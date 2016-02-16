" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility
set nocompatible

" indention
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"Change indent style for MAKE files
:autocmd FileType make set noexpandtab

" editor setup and info 
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set colorcolumn=80
set mouse=a
set number
set ruler
set ls=2
set undolevels=1000
set history=1000
set switchbuf=useopen,usetab,newtab
set showmode
filetype plugin indent on
set hidden 
" split preferences
set splitbelow
set splitright
" default window size
set lines=60
set columns=90

" searching and highlighting 
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
syntax on
au BufNewFile,BufRead *.xdc setf tcl

" color 
colorscheme molokai
" highlight column 80 and 120+
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2F3436
" set font
set guifont=Roboto\ Mono\ for\ Powerline\ 10

" folding
set foldcolumn=4
set foldmethod=syntax
set foldlevelstart=99

" ----- Custom Key Mappings -----
" disable handling of ALT keys by GUI
set winaltkeys=no
" use jj instead of ESC
inoremap jj <Esc>
" navigate long lines
nnoremap k gk
nnoremap j gj
" leader key 
let mapleader="\<Space>"
" navigate buffers with ALT + h/j/k/l
map <A-h> :bprevious <CR> 
map <A-l> :bnext <CR> 
map <A-j> :b# <CR> 
" navigate splits with CTRL + h/j/k/l
map <C-j> <C-W><C-j>
map <C-k> <C-W><C-k>
map <C-h> <C-W><C-h>
map <C-l> <C-W><C-l>
" navigate tabs CTRL + "left"/"right"
map <C-left> :tabprevious <CR>
map <C-right> :tabnext <CR>
" dehighlight with two // 
nnoremap // :nohl<CR>
" hide active window
map <leader>n :hide<CR>
" close active buffer
map <leader>q :bd<CR>

" copy/paste from clipboard
vnoremap cc "+y
noremap pp "+p

" --- NERD Tree ---
let g:nerdtree_tabs_open_on_gui_startup=0
" toggle NERD Tree
map <C-n> :NERDTreeTabsToggle<CR>
" focus on currently opened buffer
map <leader>r :NERDTreeFind<CR>

"---- UltiSnip ----
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" --- Airline ---"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' 
let g:airline_theme ='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1

"--- Signify ---"
let g:signify_vcs_list = ['hg', 'git']
map <leader>gt :SignifyToggle<CR>
map <leader>gr :SignifyRefresh<CR>
map <leader>gj <plug>(signify-next-hunk)
map <leader>gk <plug>(signify-prev-hunk)

" ---- CtrlP -----"
let g:ctrlp_match_window='top,order:btt,min:1,max:10,results:10'
let g:ctrlp_open_new_file='r'
" open Ctrlp
map <leader>p :CtrlP<CR>

" ---- Pathogen ----
" execute pathogen plugin management
execute pathogen#infect()


