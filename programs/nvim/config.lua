
vim.wo.fillchars='eob: '

vim.g.mapleader = ' '

vim.cmd("au VimEnter,BufRead,BufNewFile * lua vim.wo.fillchars='eob: '")
vim.cmd("au VimEnter,BufRead,BufNewFile * hi MsgArea guibg=none")
vim.cmd("au VimEnter,BufRead,BufNewFile * hi LineNr guibg=none")

vim.cmd("nno <expr> j v:count ? 'j' : 'gj'")
vim.cmd("nno <expr> k v:count ? 'k' : 'gk'")

vim.keymap.set("n", ";",         ":",                                          {silent = true})
vim.keymap.set("n", "Z",         "ZZ",                                         {silent = true})
vim.keymap.set("v", "K",         ":Norm<space>",                               {silent = true})
vim.keymap.set("n", "-",         "<cmd>Oil<cr>",                               {silent = true})
vim.keymap.set("n", "=",         "<cmd>ToggleAlternate<cr>",                   {silent = true})
vim.keymap.set("n", "<leader>n", "<cmd>Telescope live_grep<cr>",               {silent = true})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>",              {silent = true})
vim.keymap.set("n", "<leader>w", "<cmd>lua require('conform').format({})<cr>", {silent = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern  = '*',
  callback = function() vim.highlight.on_yank{timeout=200} end 
})

vim.o.magic=true
vim.o.wrap=true
vim.o.scrolloff=8
vim.o.hlsearch=false
vim.o.shiftwidth=2
vim.o.smartcase=true
vim.o.smarttab=true
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.swapfile=false
vim.o.tabstop=2
vim.o.termguicolors=true
vim.o.writebackup=false
vim.o.autoread=true
vim.o.backup=false
vim.o.clipboard="unnamed,unnamedplus"
vim.o.expandtab=true
vim.o.foldlevel=6
vim.o.formatoptions="cr"
vim.o.guicursor="a:hor20"
vim.o.ignorecase=true
vim.o.incsearch=true
vim.o.linespace=2
vim.o.foldlevel=99
vim.o.foldlevelstart=99
vim.o.foldenable=true
vim.o.laststatus=0
vim.o.cmdheight=0
vim.o.showmode=false
vim.o.cursorline=true
vim.o.ruler=false
vim.o.shortmess="ltToOCFI"
vim.o.number=true


require("lspconfig").gopls.setup({})
require("lspconfig").nil_ls.setup({})

require("ufo").setup({})
require("recorder").setup({})
require("gitsigns").setup({})
require("colorizer").setup({})
require("sentiment").setup({})
require("nvim-surround").setup({})
require("nvim-lastplace").setup({})
require("nvim-autopairs").setup({})

require("auto-save").setup({
	execution_message = {
		message = function() return "" end,
		dim = 0.18,
		cleaning_interval = 1250
	}
})

require("telescope").setup({
  defaults = {
    prompt_prefix = " > ",
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  }
})

require("live-command").setup({
  commands = {
    Norm = { cmd = "norm" }
  },
  enable_highlighting = false,
  inline_highlighting = false
})

require("fidget").setup({
  notification = {
    window = {
      winblend = 0
    },
    override_vim_notify = true
  }
})

require("oil").setup({
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false,
  use_default_keymaps = false,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash"
  }
})

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true
  }
})

require("Comment").setup({
  toggler = {
      line = '`'
  },
  opleader = {
    line = '`'
  }
})

require("conform").setup({
  formatters_by_ft = {
    go = {"gofmt"},
    nix = {"alejandra"}
  }
})

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

