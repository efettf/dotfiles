{
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = with inputs; [
    tmux-yank
    tmux-sensible
  ];
in {
  environment.systemPackages = lib.singleton pkgs.tmux;

  files.".config/tmux/tmux.conf".source = ./config.conf;

  systemd.services."tmux-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "tmux-plug" ''
        rm -r $HOME/.config/tmux/plugins/*
        mkdir -p $HOME/.config/tmux/plugins
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin $HOME/.config/tmux/plugins
        done
        chmod u+x $HOME/.config/tmux/plugins
      '';
    };
  };
}
