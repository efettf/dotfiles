{pkgs, ...}: {
  programs.fish.enable = true;

  homix.".config/fish/config.fish".source = ./config.fish;

  users.defaultUserShell = pkgs.fish;
}
