
{
  "norcalli/nvim-colorizer.lua",
  keys = {
    { "<leader>c", "<cmd>ColorizerToggle<cr>", desc = "Color preview toggle" }
  }
},
{
  "numToStr/Comment.nvim",
  opts = {}
},
{
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gofmt" },
      nix = { "alejandra" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback"
    }
  }
},
{
  "lewis6991/gitsigns.nvim",
  opts = {},
},
{
  'echasnovski/mini.base16',
  lazy = false,
  config = function() 
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
  end,
},
{
  "folke/noice.nvim",
  opts = { },
},
{
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  keys = {
    { "<leader>a", "<cmd>ASToggle<cr>", desc = "Auto save toggle" },
  },
  opts = {}
},
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
},
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "ray-x/cmp-treesitter",
    "efettf/cmp-emoji.nvim",
  },
  config = function()
    require("cmp").setup({
      sources = require("cmp").config.sources({
        { name = "emoji", option = { insert = false } },
        { name = "path" },
        { name = "treesitter", keyword_length = 2 },
        { name = "spell", keyword_length = 4 },
      }),
      mapping = require("cmp").mapping.preset.insert({
        ['<down>'] = require('cmp').mapping.select_next_item(),
        ['<up>'] = require('cmp').mapping.select_prev_item(),
        ['<tab>'] = require('cmp').mapping.confirm({ select = true }),
      })
    })
  end
},
{
  "chrisgrieser/nvim-recorder",
  opts = {

  },
},
{
  "stevearc/oil.nvim",
  opts = {},
  keys = { { "-", "<cmd>Oil<cr>", desc = "Enter oil" } },
  cmd = "Oil"
},
{
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope files" },
      { "<leader>n", "<cmd>Telescope live_grep<cr>", desc = "Telescope grep" },
    },
  }
},
{
  "xiyaowong/transparent.nvim",
  opts = {}
},
{
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup ({
      ensure_installed = {
        "go",
        "lua",
        "vim",
        "nix",
        "regex",
        "markdown",
        "markdown_inline",
      }
    })
  end,
},
{
  "folke/which-key.nvim",
  keys = { "<leader>", "d", "c", "v", "g" },
  cmd = "WhichKey",
}

