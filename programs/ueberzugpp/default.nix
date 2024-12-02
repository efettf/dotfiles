inputs: {
  config,
  pkgs,
  ...
}: {
  config.environment.systemPackages = [pkgs.ueberzugpp];
}
