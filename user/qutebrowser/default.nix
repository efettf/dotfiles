{
  pkgs,
  lib,
  ...
}: {
  files.".config/qutebrowser/config.py".source = ./config.py;
  files.".config/qutebrowser/theme.py".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py";
    hash = "sha256-TNLCq5eqBd3BKm/Bd0H4q1YanjsYDqNKbFFkjR4zbJ4=";
  };

  environment.systemPackages = lib.singleton pkgs.qutebrowser;
}
