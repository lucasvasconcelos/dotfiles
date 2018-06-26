set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
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
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" defaulting some global stuff
filetype indent plugin on
syntax on
set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set t_Co=256
set bg=dark

set splitbelow
set splitright

" highlight search
set incsearch
set hlsearch

" navigate between splits using this shortcuts
" yep, the hjkl vim left,up,down,right plus ctrl key
nnoremap <C-J> <C-W>__
nnoremap <C-K> <C-W>=
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" change between opened buffers
nnoremap <A-Right> :bnext<CR>
nnoremap <A-Left> :bprevious<CR>

" close tab
nnoremap <C-W> :Bclose<CR>

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
" set shortmess+=c

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

let g:syntastic_python_checkers=['flake8' ]
let g:syntastic_check_on_open=0

" YouCompleteMe customizing
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:ctrlp_map = '<C-P>'                                       
let g:ctrlp_cmd = 'CtrlP .'                                     
                                                                
augroup au_go_group                                             
  autocmd!                                                      
  autocmd FileType go set noexpandtab                           
  autocmd FileType go set tabstop=2 shiftwidth=2 softtabstop=2  
augroup END                                                     

let g:fzf_layout = { 'down': '~40%' }

au BufRead,BufNewFile *.thrift set filetype=thrift

" https://raw.githubusercontent.com/apache/thrift/master/contrib/thrift.vim
au! Syntax thrift source ~/.vim/syntax/thrift.vim
