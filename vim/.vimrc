set nocompatible              " No fully compatible with Vi :(
filetype plugin indent on     " Turn on indent to known files

" Remember to install vundle first!
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Plugins to install. Take a look at the docs on each ones github pages
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let python_highlight_all=1 " syntastic option here

syntax on " turnon the syntax

set number          " line numbers
set encoding=utf-8  " everything in utf-8 ftw
set tabstop=4       " show a tab as 4 spaces
set shiftwidth=4    " respect that when indenting
set bg=dark         " daaark 
set splitbelow      " new window below the old one
set splitright      " new window right the old one

" some remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
nnoremap <C-X> zR
nnoremap <C-A> zM

" Enable folding
set foldmethod=indent
set foldlevel=99

" Setting paste mode with F10
set pastetoggle=<F10>

" Some specific configurations for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4        |
    \ set softtabstop=4    |
    \ set shiftwidth=4     |
    \ set textwidth=119    |
    \ set expandtab        |
    \ set autoindent       |
    \ set fileformat=unix 

set shortmess+=c " Make vim warning msgs use one line only

" Some YouCompleteMe options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:syntastic_python_checkers=['python', 'pyflakes', 'flake8' ]
let g:syntastic_check_on_open=0

" Open NERDTree
map <C-n> :NERDTreeToggle<CR>

