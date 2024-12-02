inputs: {
  config,
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = [pkgs.git pkgs.gh];
    files.".gitconfig".source = ./config.ini;
  };
}
