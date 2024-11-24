
vim.cmd('source ~/.config/nvim/extra.vim')

vim.wo.fillchars='eob: '

require("lspconfig").gopls.setup({})
require("lspconfig").nil_ls.setup({})

require("oil").setup({
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false
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
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback"
  },
  formatters_by_ft = {
    go = {"gofmt"},
    nix = {"alejandra"}
  }
})

require("nvim-treesitter.configs").setup({
  parser_install_dir= "~/.config/nvim/parsers",
  ensure_installed = { 
    "go",
    "lua", 
    "vim", 
    "nix",
    "rust",
    "bash",
    "query", 
    "vimdoc", 
    "markdown", 
    "markdown_inline" 
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

