{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [(lib.importTOML ./config.toml)];

  environment.systemPackages = with pkgs; [
    gh
    fd
    go
    eza
    pass
    swww
    comma
    zoxide
    undollar
    tealdeer
    doas-sudo-shim
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
