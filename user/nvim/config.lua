
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

require("oil").setup({})
require("Comment").setup({})
require("recorder").setup({})
require("gitsigns").setup({})
require("auto-save").setup({})
require("transparent").setup({})
require("nvim-autopairs").setup({})
require("nvim-treesitter").setup ({})

require("lspconfig").gopls.setup({})
require("lspconfig").nil_ls.setup({})

require("conform").setup({
  formatters_by_ft = {
    go = { "gofmt" },
    nix = { "alejandra" }
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback"
  }
})

require("cmp").setup({
  sources = require("cmp").config.sources({
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "treesitter", keyword_length = 2 },
    { name = "spell", keyword_length = 4 }
  }),
  mapping = require("cmp").mapping.preset.insert({
    ['<down>'] = require('cmp').mapping.select_next_item(),
    ['<up>'] = require('cmp').mapping.select_prev_item(),
    ['<tab>'] = require('cmp').mapping.confirm({ select = true })
  })
})

require("mini.base16").setup({
  palette = {
    base00 = "#1e1e2e",
    base01 = "#181825",
    base02 = "#313244",
    base03 = "#45475a",
    base04 = "#585b70",
    base05 = "#cdd6f4",
    base06 = "#f5e0dc",
    base07 = "#b4befe",
    base08 = "#f38ba8",
    base09 = "#fab387",
    base0A = "#f9e2af",
    base0B = "#a6e3a1",
    base0C = "#94e2d5",
    base0D = "#89b4fa",
    base0E = "#cba6f7",
    base0F = "#f2cdcd"
  }
})

g.mapleader = " "

k.set("n", "<leader>f", "<cmd>Telescope fd<cr>")
k.set("n", "<leader>n", "<cmd>Telescope grep<cr>")

k.set("n", "-", "<cmd>Oil<cr>")

p.shortmess:append "sI"

