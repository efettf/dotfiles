return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup ({
        ensure_installed = {
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
}
