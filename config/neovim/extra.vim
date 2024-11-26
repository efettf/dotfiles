
" ### Keymaps.

let mapleader=" "

nno <expr> j v:count ? 'j' : 'gj'
nno <expr> k v:count ? 'k' : 'gk'

nno - <cmd>Oil<cr>
nno = <cmd>ToggleAlternate<cr>

nno Z ZZ
nno ; :

vno K :Norm<space>

nno <leader>f <cmd>Telescope find_files<cr>
nno <leader>n <cmd>Telescope live_grep<cr>

" ### General.

set magic
set wrap
set scrolloff=8
set nohlsearch
set shiftwidth=2
set smartcase
set smarttab
set splitbelow
set splitright
set noswapfile
set tabstop=2
set termguicolors
set nowritebackup
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

" ### Folds.
set foldlevel=99
set foldlevelstart=99
set foldenable

" ### Visual tweaks.

set laststatus=0
set cmdheight=0
set noshowmode
set cursorline
set noruler
set shm+=I
set number

au BufRead,BufNewFile * lua vim.wo.fillchars='eob: '
au BufRead * hi LineNr guibg=none

