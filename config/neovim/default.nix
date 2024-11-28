{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = with pkgs.vimPlugins;
  with inputs; [
    # Plugins from flake.
    nvim-base16
    nvim-autosave
    nvim-recorder
    nvim-sentiment
    nvim-alternatetoggler

    # Dependencies.
    plenary-nvim
    promise-async

    # Plugins from pkgs.
    nvim-ufo
    nvim-cmp
    oil-nvim
    fidget-nvim
    conform-nvim
    comment-nvim
    nvim-surround
    gitsigns-nvim
    nvim-lastplace
    nvim-lspconfig
    nvim-autopairs
    telescope-nvim
    nvim-treesitter
    transparent-nvim
    live-command-nvim
    nvim-colorizer-lua

    # Sources for nvim-cmp.
    cmp-path
    cmp-spell
    cmp-nvim-lsp
    cmp-treesitter

    # Treesitter parsers.
    nvim-treesitter-parsers.go
    nvim-treesitter-parsers.lua
    nvim-treesitter-parsers.vim
    nvim-treesitter-parsers.nix
    nvim-treesitter-parsers.just
    nvim-treesitter-parsers.rust
    nvim-treesitter-parsers.bash
    nvim-treesitter-parsers.query
    nvim-treesitter-parsers.vimdoc
    nvim-treesitter-parsers.hyprlang
    nvim-treesitter-parsers.markdown
    nvim-treesitter-parsers.markdown_inline
  ];
in {
  environment.systemPackages = with pkgs; [
    go
    ripgrep

    # Formatters.
    alejandra

    # Lsps.
    nil # nix
    gopls # go
  ];

  files.".config/nvim/init.lua".text =
    builtins.readFile ./config.lua
    + ''
      require("mini.base16").setup(${lib.generators.toLua {} {palette = config.scheme;}})
      vim.api.nvim_create_autocmd({"VimEnter", "BufRead", "BufNewFile" }, {
        pattern  = "*",
        command  = 'hi TelescopeBorder guifg=${config.scheme.base02}'
      })
    '';

  systemd.services."nvim-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = config.user;
      ExecStart = pkgs.writeShellScript "nvim-plug" ''
        mkdir -p $HOME/.config/nvim/pack/vendor/start
        rm -r $HOME/.config/nvim/pack/vendor/start/*
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin $HOME/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
