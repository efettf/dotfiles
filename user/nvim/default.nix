{
  variables,
  settings,
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
  environment.systemPackages = with pkgs;
    [
      nil
      neovim
      ripgrep
      alejandra
    ]
    ++ (
      if variables.enable.go
      then with pkgs; [go gopls]
      else []
    );

  files.".config/nvim/extra.vim".source = ./config.vim;

  files.".config/nvim/init.lua".text =
    builtins.readFile ./config.lua
    + ''
      require("mini.base16").setup(${lib.generators.toLua {} {palette = scheme;}})
    ''
    + lib.strings.concatStringsSep "\n" (map (name: ''require("${name}").setup({})'') [
      "Comment"
      "recorder"
      "gitsigns"
      "colorizer"
      "sentiment"
      "auto-save"
      "transparent"
      "nvim-autopairs"
      "nvim-treesitter"
    ]);

  systemd.services."nvim-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = settings.user;
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
