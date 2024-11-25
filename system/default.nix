{
  settings,
  pkgs,
  lib,
  ...
}: {
  imports =
    [./hardware.nix]
    ++ map (file: lib.importTOML file)
    (lib.fileset.toList
      (lib.fileset.fileFilter (file: file.hasExt "toml") ./.));

  config = {
    fonts.packages = [(pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})];

    networking.hostName = settings.host;

    environment.systemPackages = [pkgs.doas-sudo-shim];

    time.timeZone = "Europe/Warsaw";

    users.users.${settings.user} = {
      isNormalUser = true;
      initialPassword = "nixos";
      extraGroups = ["wheel"];
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];

    system.stateVersion = "24.05";
  };
}
