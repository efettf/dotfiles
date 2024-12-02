inputs: {
  config,
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = [pkgs.tmux];

    files.".config/tmux/tmux.conf".text =
      builtins.readFile ./config.sh
      + ''
        set -g pane-active-border-style bg=default,fg="${config.scheme.base02}"
        set -g pane-border-style fg="${config.scheme.base02}"
      '';
  };
}
