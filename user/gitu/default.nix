{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = lib.singleton pkgs.gitu;

  files.".config/gitu/config.toml".source = ./config.toml;
}
