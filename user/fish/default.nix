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
    serviceConfig = let
      fish-plug = pkgs.writeShellScript "fish-plug" ''
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          mkdir -p /home/lynx/.config/fish/functions
          ln -sf $plugin/functions/* /home/lynx/.config/fish/functions
          mkdir -p /home/lynx/.config/fish/conf.d
          ln -sf $plugin/conf.d/* /home/lynx/.config/fish/conf.d
        done
      '';
    in {
      Type = "oneshot";
      User = "lynx";
      ExecStart = fish-plug;
    };
  };

  users.defaultUserShell = pkgs.fish;
  documentation.man.generateCaches = false;
}
