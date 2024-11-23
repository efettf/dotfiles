{
  inputs,
  scheme,
  pkgs,
  lib,
  ...
}: let
  plugins = map (name: inputs."nvim-${name}") [
    "cmp-lsp"
    "cmp-path"
    "cmp-spell"
    "cmp-treesitter"
    "cmp"
    "recorder"
    "oil"
    "sentiment"
    "lspconfig"
    "telescope"
    "transparent"
    "plenary"
    "treesitter"
    "whichkey"
    "autopairs"
    "lastplace"
    "autosave"
    "base16"
    "gitsigns"
    "colorizer"
    "conform"
    "comment"
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
    + confPlugin "Comment" {}
    + confPlugin "recorder" {}
    + confPlugin "gitsigns" {}
    + confPlugin "sentiment" {}
    + confPlugin "auto-save" {}
    + confPlugin "transparent" {}
    + confPlugin "nvim-autopairs" {}
    + confPlugin "nvim-treesitter" {}
    + confPlugin "oil" {
      skip_confirm_for_simple_edits = true;
      prompt_save_on_select_new_entry = false;
    }
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
        rm -r $HOME/.config/nvim/pack/vendor/start/*
        mkdir -p $HOME/.config/nvim/pack/vendor/start
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin $HOME/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
