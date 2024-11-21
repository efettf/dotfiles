{
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    ./boot-loader
    ./bluetooth
    ./security
    ./network
  ];

  fonts.packages = [
    (pkgs.nerdfonts.override {fonts = lib.singleton "JetBrainsMono";})
  ];

  # Enable flakes and nix command.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
