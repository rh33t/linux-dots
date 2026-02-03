" Create required directories
" mkdir -p ~/.vim/{undo,backup,swap}

" Basic settings
set nocompatible
syntax on
filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set hidden
set wildmenu
set wildmode=longest:full,full
set lazyredraw
set ttyfast

" Persistent undo and backup
set undofile
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Mouse and splits
set mouse=a
set splitbelow
set splitright

" Security
set modelines=0
set nomodeline

" Sysadmin-specific enhancements
set showcmd
set ruler
set laststatus=2
set scrolloff=3

" Show whitespace characters
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:+

" File-specific settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePre * :%s/\s\+$//e

" ============================================================================
" Keyboard Shortcuts
" ============================================================================

" Leader key
let mapleader=" "

" Basic operations
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap Q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" Select all content
nnoremap vva ggVG

" Center cursor when scrolling
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" System clipboard operations
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Delete without yanking, then paste
xnoremap <leader>p "_dP

" File navigation
nnoremap <leader>e :Explore<CR>

" Make script executable
nnoremap <leader>xxx :!chmod +x %<CR>

" Quick save and source vimrc
nnoremap <leader>vso :source $MYVIMRC<CR>
