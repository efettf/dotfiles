{
  pkgs,
  lib,
  ...
}: {
  imports = [(lib.importTOML ./config.toml)];
  environment.systemPackages = [pkgs.doas-sudo-shim];
}
