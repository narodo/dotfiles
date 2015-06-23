set mouse=a
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set ruler
syntax on
set switchbuf=useopen,usetab,newtab
set modeline
set ls=2
set foldcolumn=4
set foldmethod=syntax
let c_no_comment_fold=1

colorscheme lucius
filetype indent on
set expandtab

"Custom Key Mappings
map <c-p> ]p
map <c-o> :nohl<CR>
map <S-t> <c-]>
map <c-J> <C-W>j<C-W>
map <c-K> <C-W>k<C-W>
map <c-H> <C-W>h<C-W>
map <c-L> <C-W>l<C-W>
vmap <F4> :!xclip -f -sel clip<CR>
map <F5> :-1r !xclip -o -sel clip<CR>
"Change indent style for MAKE files
:autocmd FileType make set noexpandtab

"add files to syntax highlighting
au BufNewFile,BufRead *.xdc setf tcl

"Change Status line background when chaning Insert mode
au InsertEnter * hi StatusLine ctermfg=Black ctermbg=Red term=none
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=Green term=none
inoremap <c-c> <Esc>
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
