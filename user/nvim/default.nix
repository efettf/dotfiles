{
  inputs,
  scheme,
  pkgs,
  lib,
  ...
}: let
  plugins = with inputs; [
    nvim-cmp-lsp
    nvim-cmp-path
    nvim-cmp-spell
    nvim-cmp-treesitter
    nvim-cmp
    nvim-recorder
    nvim-oil
    nvim-sentiment
    nvim-lspconfig
    nvim-telescope
    nvim-transparent
    nvim-plenary
    nvim-treesitter
    nvim-whichkey
    nvim-autopairs
    nvim-autosave
    nvim-base16
    nvim-gitsigns
    nvim-colorizer
    nvim-conform
    nvim-comment
  ];
in {
  environment.systemPackages = with pkgs; [
    go
    gcc
    nil
    gopls
    neovim
    ripgrep
    alejandra
  ];

  files.".config/nvim/extra.vim".source = ./config.vim;

  files.".config/nvim/init.lua".text = let
    confPlugin = name: config: ''
      require("${name}").setup(
        ${lib.generators.toLua {} config}
      )
    '';
  in
    builtins.readFile ./config.lua
    + ''
      require("lspconfig").gopls.setup({})
      require("lspconfig").nil_ls.setup({})
    ''
    + confPlugin "oil" {}
    + confPlugin "Comment" {}
    + confPlugin "recorder" {}
    + confPlugin "gitsigns" {}
    + confPlugin "sentiment" {}
    + confPlugin "auto-save" {}
    + confPlugin "transparent" {}
    + confPlugin "nvim-autopairs" {}
    + confPlugin "nvim-treesitter" {}
    + confPlugin "mini.base16" {
      palette = scheme;
    }
    + confPlugin "conform" {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        go = lib.singleton "gofmt";
        nix = lib.singleton "alejandra";
      };
    };

  systemd.services."nvim-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "nvim-plug" ''
        rm -r /home/lynx/.config/nvim/pack/vendor/start/*
        mkdir -p /home/lynx/.config/nvim/pack/vendor/start
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin /home/lynx/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
