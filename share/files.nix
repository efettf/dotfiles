{
  pkgs,
  inputs,
  ...
}: {
  homix = {
    "wallpapers".source = inputs.walls;

    ".config/gitu/config.toml".source = ../config/gitu.toml;

    ".config/tmux/tmux.conf".source = ../config/tmux.conf;

    ".config/bat/themes/catppuccin-mocha.tmTheme".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
      hash = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
    };

    ".config/qutebrowser/config.py".source = ../config/qutebrowser.py;
    ".config/qutebrowser/theme.py".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py";
      hash = "sha256-TNLCq5eqBd3BKm/Bd0H4q1YanjsYDqNKbFFkjR4zbJ4=";
    };

    ".profile".source = ../config/profile.sh;

    ".zshrc".source = ../config/zshrc;

    ".config/ohmyposh/config.toml".source = ../config/oh-my-posh.toml;
  };
}
