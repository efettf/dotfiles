{
  settings,
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = map (name: inputs."fish-${name}") [
    "transient"
    "sponge"
    "puffer"
    "zoxide"
    "pisces"
  ];
in {
  environment.systemPackages = lib.singleton pkgs.zoxide;

  programs.fish.enable = true;

  files.".config/fish/config.fish".source = ./config.fish;

  systemd.services."fish-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = settings.user;
      ExecStart = pkgs.writeShellScript "fish-plug" ''
        rm -r $HOME/.config/fish/completions/*
        rm -r $HOME/.config/fish/functions/*
        rm -r $HOME/.config/fish/conf.d/*
        mkdir -p $HOME/.config/fish/completions/
        mkdir -p $HOME/.config/fish/functions
        mkdir -p $HOME/.config/fish/conf.d
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin/completions/* $HOME/.config/fish/completions
          ln -sf $plugin/functions/* $HOME/.config/fish/functions
          ln -sf $plugin/conf.d/* $HOME/.config/fish/conf.d
        done
      '';
    };
  };

  users.defaultUserShell = pkgs.fish;
  documentation.man.generateCaches = false;
}
