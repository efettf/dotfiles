inputs: {
  pkgs,
  config,
  ...
}: {
  config = {
    environment.systemPackages = [
      pkgs.mako
      pkgs.libnotify
    ];

    files.".config/mako/config".text = ''
      sort=-time
      layer=overlay
      background-color=${config.scheme.base00}
      text-color=${config.scheme.base05}
      width=225
      height=100
      border-size=2
      border-radius=0
      ignore-timeout=1
      font=JetBrainsMono Nerd Font 10

      [urgency=low]
      border-color=${config.scheme.base0A}
      default-timeout=2500

      [urgency=normal]
      border-color=${config.scheme.base09}
      default-timeout=5000

      [urgency=high]
      border-color=${config.scheme.base08}
      default-timeout=15000
    '';
  };
}
