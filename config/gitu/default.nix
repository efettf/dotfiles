{pkgs, ...}: {
  homix.".config/gitu/config.toml".source = ./config.toml;
  environment.systemPackages = [pkgs.gitu];
}
