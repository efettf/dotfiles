{
  inputs,
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

  environment.systemPackages = with pkgs; [
    gh
    fd
    go
    eza
    pass
    swww
    comma
    tealdeer
    bibata-cursors
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Enable flakes and nix command.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
