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
    "alternatetoggler"
    "cmp"
    "recorder"
    "ufo"
    "oil"
    "sentiment"
    "lspconfig"
    "telescope"
    "transparent"
    "promise"
    "plenary"
    "treesitter"
    "autopairs"
    "lastplace"
    "autosave"
    "base16"
    "gitsigns"
    "colorizer"
    "conform"
    "comment"
  ];
  parsers = map (name: pkgs.vimPlugins.nvim-treesitter-parsers.${name}) [
    "go"
    "lua"
    "vim"
    "nix"
    "rust"
    "bash"
    "query"
    "vimdoc"
    "markdown"
    "markdown_inline"
  ];
in {
  environment.systemPackages = with pkgs;
    [
      gcc
      nil
      neovim
      ripgrep
      alejandra
    ]
    ++ (
      if variables.enable.go
      then [go gopls]
      else []
    );

  files.".config/nvim/extra.vim".text =
    builtins.readFile ./config/autocommands.vim
    + builtins.readFile ./config/options.vim
    + builtins.readFile ./config/keys.vim;
  files.".config/nvim/init.lua".text =
    builtins.readFile ./config.lua
    + ''
      require("mini.base16").setup(${lib.generators.toLua {} {palette = scheme;}})
    ''
    + lib.strings.concatStringsSep "\n" (map (name: ''require("${name}").setup({})'') [
      "ufo"
      "recorder"
      "gitsigns"
      "colorizer"
      "sentiment"
      "auto-save"
      "transparent"
      "nvim-autopairs"
    ]);

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
        for parser in ${lib.strings.concatStringsSep " " parsers}; do
          ln -sf $parser $HOME/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
