if exists('g:vscode')

    " ----- Custom Key Mappings -----
    let mapleader="\<Space>"
    " navigate buffers with  <leader> + h/j/k/l
    nnoremap // :nohl<CR>
    " split windows
    map <leader>sv :vsplit<CR>
    map <leader>sh :split<CR>

    " close buffer/tab 
    map <leader>bc :tabclose<CR>
    map <leader>bo :tabonly<CR>
    
    " copy/paste from clipboard
    vnoremap cc "+y
    noremap pp "+pf
    
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    
else
    
    "------ Plug  -------------
    call plug#begin('~/.config/nvim/plugged')

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tomasr/molokai'
    Plug 'sickill/vim-monokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'numkil/ag.nvim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'

    call plug#end()
    " ------- Plug End ---------

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
    "
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
    set updatetime=300
    " searching and highlighting 
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " syntax highlighting
    syntax on
    au BufNewFile,BufRead *.xdc setf tcl

    " --- Color scheme  ---
    colorscheme molokai
    
    " remove background from matched bracket
    hi MatchParen      ctermfg=208  ctermbg=bg cterm=bold
    
    " highlight column 80 and 120+
    let &colorcolumn="80"
    highlight ColorColumn ctermbg=100 guibg=#2F3436
    "
    " set font
    set guifont=Roboto\ Mono\ for\ Powerline\ 10

    " --- Color scheme end  ---
    "
    " folding
    set foldcolumn=4
    set foldmethod=syntax
    set foldlevelstart=99
    set t_ut=

    " ----- Custom Key Mappings -----
    " leader key 
    let mapleader="\<Space>"
    "
    " disable handling of ALT keys by GUI
    set winaltkeys=no
   
    " use jj instead of ESC
    inoremap jj <Esc>
   
    " navigate long lines
    "nnoremap k gk
    "nnoremap j gj

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
    
    "dehighlight with two // 
    nnoremap // :nohl<CR>
    
    " hide active window
    map <leader>bh :hide<CR>
    
    " close active buffer
    map <leader>bc :bd<CR>
    
    " split windows
    map <leader>sv :vsplit<CR>
    map <leader>sh :split<CR>
    
    " copy/paste from clipboard
    vnoremap cc "+y
    noremap pp "+p

    " --- NERD Tree ---
    let g:nerdtree_tabs_open_on_gui_startup=0
    " toggle NERD Tree
    map <leader>n :NERDTreeToggle<CR>
    " focus on currently opened buffer
    map <leader>r :NERDTreeFind<CR>

    " --- Airline ---"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t' 
    let g:airline_theme='dark'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#branch#enabled = 1

    "---- CtrlP ----"
    map <leader>pb :CtrlPBuffer<CR>
    map <leader>pf :CtrlP<CR>
    map <leader>pm :CtrlPMRU<CR>
    let g:ctrlp_show_hidden = 1


    "----   CoC    ------"
    " Use tab for trigger completion  
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    h
    "---- End  CoC ------"


endif
