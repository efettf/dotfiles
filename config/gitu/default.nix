{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gitu
  ];

  files.".config/gitu/config.toml".source = ./config.toml;
}
