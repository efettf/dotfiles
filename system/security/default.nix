{
  pkgs,
  lib,
  ...
}: {
  imports = lib.singleton (lib.importTOML ./config.toml);
  environment.systemPackages = lib.singleton pkgs.doas-sudo-shim;
}
