return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'efettf/cmp-emoji.nvim',
    },
    config = function()
      require("cmp").setup({
        sources = require("cmp").config.sources({
          { name = "buffer" },
          { name = "emoji", option = { insert = false } },
        }),
        mapping = require("cmp").mapping.preset.insert({
          ['<down>'] = require('cmp').mapping.select_next_item(),
          ['<up>'] = require('cmp').mapping.select_prev_item(),
          ['<tab>'] = require('cmp').mapping.confirm({ select = true }),
        })
      })
    end
  },
}
