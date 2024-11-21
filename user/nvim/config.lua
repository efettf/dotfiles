
vim.cmd('source ~/.config/nvim/extra.vim')

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

