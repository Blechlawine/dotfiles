set nocompatible " disable compatibility to old-time vim
set showmatch " show matching
set ignorecase " case insensitive
set mouse=v " middle-click paste
set hlsearch " highlight search
set incsearch " incremental search
set tabstop=4 " tab-size
set softtabstop=4 " see multiple spaces as a tab
set expandtab " converts tabs to white space
set shiftwidth=4 " width for autoindents
set autoindent " indent a new line the same as the current one
set number " show line numbers
set wildmode=longest,list "get bash-like tab completion
set cc=120 " set a 120 column border
filetype plugin indent on " allow auto-indenting depending on filetype
syntax on " syntax highlighting
set mouse=a " enable mouse click
set clipboard=unnamedplus " use system clipboard
filetype plugin on
set cursorline " highlight current cursorline
set ttyfast " speed up scrolling

" vim-plug package-manager
call plug#begin("~/.vim/plugged")
" Plugins here
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'honza/vim-snippets'
 Plug 'SirVer/ultisnips'
 Plug 'neoclide/coc.nvim'
 Plug 'mattn/emmet-vim'
 Plug 'itchyny/lightline.vim'
 Plug 'EdenEast/nightfox.nvim'
call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

syntax enable

colorscheme dracula

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

