
let mapleader=' '

au BufRead,BufNewFile * lua vim.wo.fillchars='eob: '

nno <leader>f <cmd>Telescope find_files<cr>
nno <leader>n <cmd>Telescope grep_string<cr>

nno - <cmd>Oil<cr>

nno Z ZZ
nno ; :

