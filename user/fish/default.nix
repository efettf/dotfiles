{pkgs, ...}: {
  environment.systemPackages = [pkgs.zoxide];

  programs.fish.enable = true;

  files.".config/fish/config.fish".source = ./config.fish;

  users.defaultUserShell = pkgs.fish;
  documentation.man.generateCaches = false;
}
