{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    go
    gcc
    neovim
    ripgrep
    alejandra
  ];

  files.".config/nvim/extra.vim".source = ./config.vim;

  files.".config/nvim/init.lua".text =
    builtins.readFile ./config.lua
    + ''
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
      end
      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup({ spec = { ${builtins.readFile ./plugins.lua} } })
    '';
}
