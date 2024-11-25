{pkgs, ...}: {
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
    ".config/tmux/tmux.conf".source = ./tmux.conf;
    ".gitconfig".source = ./git.ini;
  };

  programs.nano.enable = false;
}
