
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
o.showmode = false
o.scrolloff = 8
o.shiftwidth = 2
o.smartcase = true
o.signcolumn = "yes"
o.smarttab = true
o.ruler = false
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.writebackup = false

require("cmp").setup({
  sources = require("cmp").config.sources({
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "treesitter", keyword_length = 2 },
    { name = "spell", keyword_length = 4 }
  }),
  experimental = {
    ghost_text = true
  },
  mapping = require("cmp").mapping.preset.insert({
    ['<down>'] = require('cmp').mapping.select_next_item(),
    ['<up>'] = require('cmp').mapping.select_prev_item(),
    ['<tab>'] = require('cmp').mapping.confirm({ select = true })
  })
})

g.mapleader = " "

k.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
k.set("n", "<leader>n", "<cmd>Telescope grep_string<cr>")

k.set("n", "-", "<cmd>Oil<cr>")

p.shortmess:append "sI"

