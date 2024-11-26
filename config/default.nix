{
  pkgs,
  scheme, 
  ...
}: {
  imports = [
    ./neovim
    ./hyprland
    ./qutebrowser
  ];

  environment.systemPackages = with pkgs; [
    # Git tools.
    gh
    git
    gitu

    # Interactive tools.
    fd
    fzf
    eza
    zoxide
    tealdeer

    # Others.
    tmux
    swww
    just
    comma
    neovim
    wlsunset
    qutebrowser
    wl-clipboard

    # Cursors.
    banana-cursor

    # Fish plugins.
    fishPlugins.puffer
    fishPlugins.sponge
    fishPlugins.pisces
    fishPlugins.transient-fish
  ];

  # Fish tweaks.
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  documentation.man.generateCaches = false; # Fixes a slowdown on rebuild.

  files = {
    ".config/fish/config.fish".source = ./config.fish;
    ".config/gitu/config.toml".source = ./gitu.toml;
    ".gitconfig".source = ./git.ini;
  };

  files.".config/tmux/tmux.conf".text = 
  ''
    set -g pane-active-border-style bg=default,fg="${scheme.base02}"
    set -g pane-border-style fg="${scheme.base02}"
  '' 
  + builtins.readFile ./tmux.conf;

  programs.nano.enable = false;
}
