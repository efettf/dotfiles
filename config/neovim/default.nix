{
  settings,
  inputs,
  scheme,
  pkgs,
  lib,
  ...
}: let
  plugins = with pkgs.vimPlugins;
  with nvim-treesitter-parsers;
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
    conform-nvim
    comment-nvim
    autosave-nvim
    gitsigns-nvim
    nvim-lastplace
    nvim-lspconfig
    nvim-autopairs
    telescope-nvim
    nvim-treesitter
    nvim-colorizer-lua

    # Sources for nvim-cmp.
    cmp-path
    cmp-spell
    cmp-nvim-lsp
    cmp-treesitter

    # Treesitter parsers.
    go
    lua
    vim
    nix
    rust
    bash
    query
    vimdoc
    markdown
    markdown_inline
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
      require("mini.base16").setup(${lib.generators.toLua {} {
        palette = {
          base00 = scheme.base01;
          inherit
            (scheme)
            base01
            base02
            base03
            base04
            base05
            base06
            base07
            base08
            base09
            base0A
            base0B
            base0C
            base0D
            base0E
            base0F
            ;
        };
      }})
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
