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

" searching and highlighting 
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
syntax on
au BufNewFile,BufRead *.xdc setf tcl

" color 
colorscheme lucius
highlight ColorColumn ctermbg=darkgrey

" folding
set foldcolumn=4
set foldmethod=syntax

" ----- Custom Key Mappings -----
" use jj instead of ESC
inoremap jj <Esc>
" navigate long lines
nnoremap k gk
nnoremap j gj
" leader key
let mapleader=","
" navigate vsplits with CTRL + h/j/k/l
map <c-J> <C-W>j<C-W>
map <c-K> <C-W>k<C-W>
map <c-H> <C-W>h<C-W>
map <c-L> <C-W>l<C-W>
" navigate tabs CTRL + "left"/"right"
map <C-left> :tabp <CR>
map <C-right> :tabp <CR>
" toggle NERD Tree
map <C-n> :NERDTreeTabsToggle<CR>
" focus on currently opened buffer
map <leader>r :NERDTreeFind<CR>
" dehighlight with oo
nnoremap oo :nohl<CR>

" copy/paste from clipboard
vnoremap cc "+y
noremap pp "+p

" --- NERD Tree ---
" automaticall start NERDTree
autocmd vimenter * NERDTree
" focus main window
autocmd vimenter * wincmd p


" execute pathogen plugin management
execute pathogen#infect()


