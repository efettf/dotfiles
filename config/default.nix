{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./neovim
    ./qutebrowser
  ];

  environment.systemPackages = with pkgs; [
    # Git tools.
    gh
    git
    gitu

    fd
    fzf
    mpd
    eza
    tmux
    swww
    just
    mako
    acpi
    grim
    slurp
    zoxide
    yt-dlp
    neovim
    mpc-cli
    ncmpcpp
    tealdeer
    wlsunset
    libnotify
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
    ".config/ncmpcpp/bindings".source = ./ncmpcpp.binds;
    ".config/fish/config.fish".source = ./config.fish;
    ".config/gitu/config.toml".source = ./gitu.toml;
    ".config/mpd/mpd.conf".source = ./mpd.conf;
    ".gitconfig".source = ./git.ini;
  };

  files.".config/tmux/tmux.conf".text =
    ''
      set -g pane-active-border-style bg=default,fg="${config.scheme.base02}"
      set -g pane-border-style fg="${config.scheme.base02}"
    ''
    + builtins.readFile ./tmux.conf;

  files.".config/mako/config".text = ''
    sort=-time
    layer=overlay
    background-color=${config.scheme.base00}
    text-color=${config.scheme.base05}
    width=225
    height=100
    border-size=2
    border-radius=2
    ignore-timeout=1
    font=JetBrainsMono Nerd Font 10

    [urgency=low]
    border-color=${config.scheme.base0A}
    default-timeout=2500

    [urgency=normal]
    border-color=${config.scheme.base09}
    default-timeout=5000

    [urgency=high]
    border-color=${config.scheme.base08}
    default-timeout=15000
  '';

  programs.nano.enable = false;
}
