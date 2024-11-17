{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gitu
  ];

  homix.".config/gitu/config.toml".source = ./config.toml;
}
