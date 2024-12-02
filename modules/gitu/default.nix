inputs: {
  config,
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = [pkgs.gitu];
    files.".config/gitu/config.toml".source = ./config.toml;
  };
}
