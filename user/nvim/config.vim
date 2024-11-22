
set autoread
set nobackup
set clipboard^=unnamed,unnamedplus
set expandtab
set foldlevel=6
set formatoptions="cr"
set guicursor="a:hor20"
set ignorecase
set incsearch
set linespace=2
set magic
set shm+=I
set laststatus=0
set number
set noshowmode
set wrap
set scrolloff=8
set nohlsearch
set shiftwidth=2
set smartcase
set smarttab
set noruler
set splitbelow
set splitright
set noswapfile
set tabstop=2
set termguicolors
set nowritebackup


let mapleader=" "

au BufRead,BufNewFile * lua vim.wo.fillchars='eob: '

nno <leader>f <cmd>Telescope find_files<cr>
nno <leader>n <cmd>Telescope grep_string<cr>

nno - <cmd>Oil<cr>

nno Z ZZ
nno ; :

