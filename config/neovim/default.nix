{
  settings,
  inputs,
  scheme,
  pkgs,
  lib,
  ...
}: let
  plugins = with pkgs.vimPlugins;
  with inputs; [
    # Plugins from flake.
    nvim-base16
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
    autosave-nvim
    gitsigns-nvim
    nvim-lastplace
    nvim-lspconfig
    nvim-autopairs
    telescope-nvim
    nvim-treesitter
    transparent-nvim
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
      vim.cmd('source ${./extra.vim}')
      require("mini.base16").setup(${lib.generators.toLua {} {palette = scheme;}})
    '';

  systemd.services."nvim-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = settings.user;
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
