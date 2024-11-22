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
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "tmux-plug" ''
        rm -r /home/lynx/.config/tmux/plugins/*
        mkdir -p /home/lynx/.config/tmux/plugins
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin /home/lynx/.config/tmux/plugins
        done
        chmod u+x /home/lynx/.config/tmux/plugins
      '';
    };
  };
}
