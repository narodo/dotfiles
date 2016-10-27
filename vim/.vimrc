"-- check if we are running vim or neovim --
  if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
  else
    let s:editor_root=expand("~/.vim")
  endif
"

"------ Vundle -------------
set nocompatible
filetype off
set rtp+=~/tools/tools_and_scripts/vim/bundle/vundle/
call vundle#rc()
call vundle#rc(s:editor_root . '/bundle')
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'numkil/ag.nvim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'mhinz/vim-signify'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
" ------- Vundle End ---------

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
"set softtabstop=4
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
set relativenumber
filetype plugin indent on
set hidden 
" split preferences
set splitbelow
set splitright
" timeout
set timeout
set ttimeout 
set timeoutlen=600
" searching and highlighting 
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
syntax on
au BufNewFile,BufRead *.xdc setf tcl

" color 
"set background=dark
colorscheme molokai
"
" highlight column 80 and 120+
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=100 guibg=#2F3436
" set font
set guifont=Roboto\ Mono\ for\ Powerline\ 10

" folding
set foldcolumn=4
set foldmethod=syntax
set foldlevelstart=99
set t_ut=

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
" navigate buffers with  <leader> + h/j/k/l
map <leader>h :bprevious <CR> 
map <leader>l :bnext <CR> 
map <leader>j :b# <CR> 
" navigate splits with CTRL + h/j/k/l
map <C-j> <C-W><C-j>
map <C-k> <C-W><C-k>
map <C-h> <C-W><C-h>
map <C-l> <C-W><C-l>
" resize pane
map <C-Down> <C-W>-
map <C-Up> <C-W>+
map <C-Left> <C-W><
map <C-Right> <C-W>>
" navigate tabs CTRL + "left"/"right"
"map <C-left> :tabprevious <CR>
"map <C-right> :tabnext <CR>
"dehighlight with two // 
nnoremap // :nohl<CR>
" hide active window
map <leader>bh :hide<CR>
" close active buffer
map <leader>bq :bw<CR>
" split windows
map <leader>sv :vsplit<CR>
map <leader>sh :split<CR>
" copy/paste from clipboard
vnoremap cc "+y
noremap pp "+p

" --- Color scheme fixup ---
" remove background from matched bracket
hi MatchParen      ctermfg=208  ctermbg=bg cterm=bold
  
" --- NERD Tree ---
let g:nerdtree_tabs_open_on_gui_startup=0
" toggle NERD Tree
map <leader>n :NERDTreeTabsToggle<CR>
" focus on currently opened buffer
map <leader>r :NERDTreeFind<CR>

" --- Airline ---"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' 
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1

"--- Signify ---"
let g:signify_vcs_list = ['hg', 'git']
map <leader>gt :SignifyToggle<CR>
map <leader>gr :SignifyRefresh<CR>
map <leader>gj <plug>(signify-next-hunk)

"---- CtrlP ----"
map <leader>pb :CtrlPBuffer<CR>
map <leader>pf :CtrlP<CR>
map <leader>pm :CtrlPMRU<CR>
let g:ctrlp_show_hidden = 1

" ---- Eclim -----"
let g:EclimCompletionMethod = 'omnifunc'

" --- custom syntax
au BufRead,BufNewFile *.psm setfiletype psm
let g:tlist_psm_settings  = 'psm;l:labels'

" ---- NeoVim specific stuff ---
if has('nvim')
    " --- Terminal mode exit mapping ---
    let g:terminal_scrollback_buffer_size = 100000
    highlight TermCursor ctermfg=red guifg=red
    :tnoremap <leader><Esc> <C-\><C-n>
    " --- Navigate terminal panes the same as normal panes 
    :tnoremap <C-j> <C-\><C-n><C-W><C-j>
    :tnoremap <C-k> <C-\><C-n><C-W><C-k>
    :tnoremap <C-h> <C-\><C-n><C-W><C-h>
    :tnoremap <C-l> <C-\><C-n><C-W><C-l>
    " --- always enterh terminal panes in 'insert' mode 
    :au BufEnter * if &buftype == 'terminal' | :startinsert | endif

    " ---- create FPGA workspace ----
    function! FPGAwork()
        "make two columns
        lcd ~/work/vivado_platform
        let numcol =2
        lefta vsp | lcd ~/work/vivado_platform | term
        file Term-1
        split     | lcd ~/work/vivado_platform | term
        file Term-2
        split     | lcd ~/work/vivado_platform | term
        file Term-3
    endfunction

    function! FWwork()
        "make two columns
        lcd ~/work/platform
        let numcol =2
        lefta vsp | lcd ~/work/platform | term
        file Term-1
        split     | lcd ~/work/platform | term
        file Term-2
        split     | term minicom -D /dev/ttyUSB0
        file minicom
    endfunction

endif 
