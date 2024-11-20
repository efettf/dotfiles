{
  inputs,
  pkgs,
  lib,
  ...
}: let
  plugins = with inputs; [
    fish-transient
    fish-sponge
    fish-puffer
    fish-zoxide
    fish-pisces
  ];
in {
  environment.systemPackages = lib.singleton pkgs.zoxide;

  programs.fish.enable = true;

  files.".config/fish/config.fish".source = ./config.fish;

  systemd.services."fish-plug" = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      User = "lynx";
      ExecStart = pkgs.writeShellScript "fish-plug" ''
        mkdir -p /home/lynx/.config/fish/functions
        mkdir -p /home/lynx/.config/fish/conf.d
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin/functions/* /home/lynx/.config/fish/functions
          ln -sf $plugin/conf.d/* /home/lynx/.config/fish/conf.d
        done
      '';
    };
  };

  users.defaultUserShell = pkgs.fish;
  documentation.man.generateCaches = false;
}
