

-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.neovide_transparency = 0.85
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_right = 7
vim.g.neovide_padding_left = 1
vim.g.neovide_padding_top = 10

require("lazy").setup({
  spec = { import = "plugins" }
})

vim.api.nvim_set_keymap("n", "<c-=>", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-->", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<cr>", { silent = true })

vim.o.autoread = true
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.foldlevel = 6
vim.o.formatoptions = "cr"
vim.o.guicursor = "a:hor20"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 0
vim.o.linespace = 2
vim.o.magic = true
vim.o.number = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.writebackup = false


