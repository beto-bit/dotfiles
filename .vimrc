" No strange things
set nocompatible
set background=dark

if has('termguicolors')
    set termguicolors
endif

" UTF-8 enconding
set encoding=utf8

" Smort
set autoindent
set smartindent

" Show line numbers
set number

" Mouse
set mouse=a

" ====== Tabs ======
" Tabs are four (just in case)
set tabstop=4

" Spaces is better than tabs
set expandtab

" Tab -> 4 spaces
set shiftwidth=4
" ====== + ======

" Smort search
set incsearch
set ignorecase
set hlsearch
set smartcase

" Autocompletion (holy shit (not so exciting))
set wildmenu
set wildmode=list:longest

" For some reason, Vim only opens .asm files correctly the first time
au BufNewFile,BufRead,BufReadPost *.asm set syntax=asm


" Vim-plug autoinstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Init this
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'cohama/lexima.vim'

call plug#end()

" Color theme
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

