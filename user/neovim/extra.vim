
au BufRead,BufNewFile * lua vim.wo.fillchars='eob: '

au BufRead * hi LineNr guibg=none

let mapleader=" "

nno <expr> j v:count ? 'j' : 'gj'
nno <expr> k v:count ? 'k' : 'gk'

nno = <c-x>
nno + <c-a>

nno \ <cmd>ToggleAlternate<cr>

nno Z ZZ
nno ; :

nno <leader>f <cmd>Telescope find_files<cr>
nno <leader>n <cmd>Telescope live_grep<cr>

nno - <cmd>Oil<cr>

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

" Folds, mainly for nvim-ufo.
set foldlevel=99
set foldlevelstart=99
set foldenable

" Disable nvim intro.
set shm+=I

" Hide status.
set laststatus=0
set number
set noshowmode
set noruler

set magic
set wrap
set scrolloff=8
set cursorline
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

