
"------ Plug  -------------
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Asheq/close-buffers.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'folke/which-key.nvim', {'branch': 'main'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

call plug#end()
" ------- Plug End ---------

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set termguicolors

" disable vi compatibility
set nocompatible

" indention
set autoindent
set smartindent
set tabstop=8

"set softtabstop=4
set shiftwidth=8
"set expandtab
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
set switchbuf=useopen,usetab,split
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

" delete trailing white spaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" syntax highlighting
syntax on

" --- Color scheme  ---
colorscheme gruvbox
"
" remove background from matched bracket
"hi MatchParen      ctermfg=208  ctermbg=bg cterm=bold

" highlight column 80 and 120+
"let &colorcolumn="80"
"highlight ColorColumn ctermbg=100 guibg=#2F3436
"
" set font
"set guifont=Roboto\ Mono\ for\ Powerline\ 10
"
" --- Color scheme end  ---
"
" folding
set foldcolumn=0
"set foldmethod=syntax
"set foldlevelstart=99
"set t_ut=

" ----- Custom Key Mappings -----
" leader key
let mapleader="\<Space>"
"
" disable handling of ALT keys by GUI
set winaltkeys=no

" use jj instead of ESC
inoremap jj <Esc>

" navigate buffers with  <leader> + h/j/k/l
map <leader>h :bprevious<CR>
map <leader>l :bnext<CR>
map <leader>j :b#<CR>

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

" copy/paste from clipboard
set clipboard+=unnamedplus
"vnoremap cc "+y
"noremap pp "+p

" Map CTRl-Q CTRL-Q to exit terminal mode
tnoremap <C-q><C-q> <C-\><C-n>

" --- NERD Tree ---
let g:nerdtree_tabs_open_on_gui_startup=0
" toggle NERD Tree
map <leader>n :NERDTreeToggle<CR>
" focus on currently opened buffer
map <leader>r :NERDTreeFind<CR>

" --- Airline ---"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme='dark'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

"function! WindowNumber(...)
    "let builder = a:1
    "let context = a:2
    "call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    "return 0
"endfunction

"call airline#add_statusline_func('WindowNumber')
"call airline#add_inactive_statusline_func('WindowNumber')

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"---- End  CoC ------"
"

" Debugger
" See https://neovim.io/doc/user/nvim_terminal_emulator.html
packadd termdebug

let g:termdebug_wide = 164
let g:termdebug_popup = 0

nnoremap <silent> <leader>b :Break<CR>
nnoremap <silent> <leader>bc :Clear<CR>
nnoremap <silent> <leader>c :Continue<CR>


"---- Statusline ----
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

"---- FZF ----
"nnoremap <leader>ff :Files<CR>
"nnoremap <leader>fl :Lines<CR>
"nnoremap <leader>flb :BLines<CR>
"nnoremap <leader>fb :Buffers<CR>
"nnoremap <leader>fg :Rg<CR>
"nnoremap <leader>fm :History<CR>

"---- Telescope ----
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fj <cmd>Telescope current_buffer_fuzzy_find<cr>

lua << EOF
require("which-key").setup {

    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
EOF


lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    path_display = {"smart"},
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers = {
      theme = "dropdown",
    },

    live_grep = {
      theme = "dropdown",
    },
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
EOF
