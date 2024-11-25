{
  settings,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    ./hardware.nix
  ];

  fonts.packages = lib.singleton (pkgs.nerdfonts.override {fonts = lib.singleton "JetBrainsMono";});

  networking.hostName = settings.host;

  users.users.${settings.user} = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = lib.singleton "wheel";
  };

  # Enable flakes and nix command.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
