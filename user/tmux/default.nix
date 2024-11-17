{pkgs, ...}: {
  environment.systemPackages = [pkgs.tmux];
  files.".config/tmux/tmux.conf".source = ./config.conf;
}
