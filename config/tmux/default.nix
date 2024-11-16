{pkgs, ...}: {
  environment.systemPackages = [pkgs.tmux];
  homix.".config/tmux/tmux.conf".source = ./config.conf;
}
