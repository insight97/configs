"General setting"

set nu
set tabstop=4
set showcmd
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE

hi DiffAdd term=reverse cterm=bold ctermbg=black ctermfg=green
hi DiffChange term=reverse cterm=bold ctermbg=black ctermfg=gray
hi DiffText term=reverse cterm=bold ctermbg=darkblue ctermfg=yellow
hi DiffDelete term=reverse cterm=bold ctermbg=black ctermfg=darkred

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>
" move to and maximize the above split
map <C-K> <C-W>k<C-W>
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w>

"set wmw=20   " set the min width of a window to 0 so we canmaximize others
"set wmh=999   " set the min height of a window to 0 so we canmaximize others
" }


" Reload configs "
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" install vundle "

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

" vundle setting "
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'

call vundle#end()
filetype plugin indent on

" Auto install plugins "
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
  :qall
endif

" Plugin config "

nnoremap <silent> <f9> :Tlist<CR>
let Tlist_Ctags_Cmd='ctags'

nnoremap <silent> <F5> :NERDTree<CR>
highlight VertSplit ctermbg=NONE
