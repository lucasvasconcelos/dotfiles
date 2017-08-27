set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Chiel92/vim-autoformat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required

" defaulting some global stuff
syntax on
set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4

colorscheme sunburst
set bg=dark

set splitbelow
set splitright

" highlight search
set hlsearch

" navigate between splits using this shortcuts
" yep, the hjkl vim left,up,down,right plus ctrl key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Setting paste mode with F10
set pastetoggle=<F10>

" fold/unfold with space bar
nnoremap <space> za

nnoremap <C-X> zR " unfold all
nnoremap <C-A> zM " fold all

" remove unwanted msgs from vi
set shortmess+=c

" highlight trailing whitespaces
highlight BadWhitespace ctermbg=red

" Open NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1

" internet stuff
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" python stuff
" inspired by https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" install pyflakes, flake8, pep8 and autopep8 globally to use all the features here
let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4        |
    \ set softtabstop=4    |
    \ set shiftwidth=4     |
    \ set textwidth=79     |
    \ set expandtab        |
    \ set autoindent       |
    \ set fileformat=unix 

let g:syntastic_python_checkers=['python', 'pyflakes', 'flake8' ]
let g:syntastic_check_on_open=0

" YouCompleteMe customizing
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
