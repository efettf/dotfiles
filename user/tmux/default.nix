{
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = [
    "yank"
    "sensible"
  ];
in {
  environment.systemPackages = lib.singleton pkgs.tmux;

  files.".config/tmux/tmux.conf".text =
    builtins.readFile ./config.conf
    + lib.strings.concatStringsSep "\n" (map (name: "run '~/.config/tmux/plugins/*/${name}.tmux'") plugins);

  systemd.services."tmux-plug" = {
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "tmux-plug" ''
        rm -r $HOME/.config/tmux/plugins/*
        mkdir -p $HOME/.config/tmux/plugins
        for plugin in ${lib.strings.concatStringsSep " " (map (name: inputs."tmux-${name}") plugins)}; do
          ln -sf $plugin $HOME/.config/tmux/plugins
        done
        chmod u+x $HOME/.config/tmux/plugins
      '';
    };
  };
}
