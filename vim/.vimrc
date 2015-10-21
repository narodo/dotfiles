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

" folding
set foldcolumn=4
set foldmethod=syntax
set foldlevelstart=99

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
" dehighlight with two // 
nnoremap // :nohl<CR>

" copy/paste from clipboard
vnoremap cc "+y
noremap pp "+p

" --- NERD Tree ---
let g:nerdtree_tabs_open_on_gui_startup=0
"---- UltiSnip ----
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'


" ---- Pathogen ----
" execute pathogen plugin management
execute pathogen#infect()


