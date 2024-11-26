
vim.wo.fillchars='eob: '

require("lspconfig").gopls.setup({})
require("lspconfig").nil_ls.setup({})

require("ufo").setup({})
require("recorder").setup({})
require("gitsigns").setup({})
require("autosave").setup({})
require("colorizer").setup({})
require("sentiment").setup({})
require("nvim-lastplace").setup({})
require("nvim-autopairs").setup({})

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
  prompt_save_on_select_new_entry = false
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
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback"
  },
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

