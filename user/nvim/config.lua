
vim.cmd('source ~/.config/nvim/extra.vim')

local o = vim.o
local g = vim.g
local p = vim.opt
local a = vim.api
local k = vim.keymap

o.autoread = true
o.backup = false
o.clipboard = "unnamedplus"
o.expandtab = true
o.foldlevel = 6
o.formatoptions = "cr"
o.guicursor = "a:hor20"
o.ignorecase = true
o.incsearch = true
o.linespace = 2
o.magic = true
o.laststatus = 0
o.number = true
o.scrolloff = 8
o.shiftwidth = 2
o.smartcase = true
o.signcolumn = "yes"
o.smarttab = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.writebackup = false

g.mapleader = " "

p.shortmess:append "sI"

a.nvim_set_keymap("n", "<c-=>", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<cr>", { silent = true })
a.nvim_set_keymap("n", "<c-->", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<cr>", { silent = true })

k.set("n", "<leader>r", "<cmd>Lazy<cr>")

