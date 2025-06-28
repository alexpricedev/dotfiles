" Install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
" File explorer
Plug 'preservim/nerdtree'
" Syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'
" Dark theme
Plug 'joshdick/onedark.vim'
call plug#end()

" Basic settings
set encoding=utf-8
set number relativenumber       " Relative line numbers
set expandtab                   " Use spaces instead of tabs
set tabstop=2                   " 2 spaces for tab
set shiftwidth=2                " 2 spaces for indent
set autoindent                  " Auto indent
set smartindent                 " Smart indent
set wrap                        " Wrap lines
set linebreak                   " Wrap at word boundaries
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive if uppercase
set incsearch                   " Incremental search
set hlsearch                    " Highlight search results
set splitbelow                  " New splits below
set splitright                  " New splits to the right
set hidden                      " Allow hidden buffers
set noswapfile                  " No swap files
set nobackup                    " No backup files
set undofile                    " Persistent undo
set undodir=~/.vim/undodir      " Undo directory
set scrolloff=8                 " Keep 8 lines visible when scrolling
set signcolumn=yes              " Always show sign column
set updatetime=300              " Faster completion
set timeoutlen=500              " Faster key sequence completion
set clipboard=unnamedplus       " Use system clipboard
set mouse=a                     " Enable mouse support

" Create undo directory if it doesn't exist
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif

" Appearance
set termguicolors               " True colors
syntax on                       " Syntax highlighting
colorscheme onedark             " Dark theme
set laststatus=2                " Always show status line
set statusline=%f\ %m%r%h%w     " Minimal status line: filename + flags
set cursorline                  " Highlight current line

" NERDTree settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['node_modules', '.git$', '.DS_Store']
let g:NERDTreeWinSize = 24

" Key mappings (minimal)
let mapleader = " "             " Space as leader key

" NERDTree toggle
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader><leader> :NERDTreeToggle<CR>
" Find current file in NERDTree
nnoremap <leader>f :NERDTreeFind<CR>

" Clear search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto commands
augroup vimrc
  autocmd!
  " Close vim if NERDTree is the only window left
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " Start NERDTree when vim starts with a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
augroup END

" File type specific settings
autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType json setlocal ts=2 sw=2 sts=2
autocmd FileType typescript,typescriptreact setlocal ts=2 sw=2 sts=2
autocmd FileType javascript,javascriptreact setlocal ts=2 sw=2 sts=2
autocmd FileType html,css setlocal ts=2 sw=2 sts=2
autocmd FileType sh setlocal ts=2 sw=2 sts=2
