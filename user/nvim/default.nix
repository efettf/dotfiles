{
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = with inputs; [
    nvim-cmp-path
    nvim-cmp-spell
    nvim-cmp-treesitter
    nvim-cmp
    nvim-recorder
    nvim-oil
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
    neovim
    ripgrep
    alejandra
  ];

  files.".config/nvim/extra.vim".source = ./config.vim;

  files.".config/nvim/init.lua".source = ./config.lua;

  systemd.services."nvim-plug" = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "nvim-plug" ''
        mkdir -p /home/lynx/.config/nvim/pack/vendor/start
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin /home/lynx/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
