{pkgs, ...}: {
  homix = {
    "wallpapers".source = pkgs.fetchgit {
      url = "https://github.com/efettf/wallpapers";
      hash = "sha256-Rinz1qPIaljSt0/dGb+kZEFGQXcQ855fI4EjZP1m7nM=";
    };

    ".config/nvim/init.lua".source = ./nvim/init.lua;
    ".config/nvim/lua/plugins".source = ./nvim/plugins;

    ".config/tmux/tmux.conf".source = ./programs/tmux.conf;
    ".config/tmux/tpm".source = pkgs.fetchgit {
      url = "https://github.com/tmux-plugins/tpm";
      hash = "sha256-1agBX7r4tEdG3fRvsuXHj+YfhsIj0eLLA1Wl8fP+UbQ=";
    };

    ".config/hypr/hyprland.conf".source = ./programs/hyprland.conf;

    ".config/alacritty/alacritty.toml".source = ./programs/alacritty.toml;
    ".config/alacritty/catppuccin".source = pkgs.fetchgit {
      url = "https://github.com/catppuccin/alacritty";
      hash = "sha256-H8bouVCS46h0DgQ+oYY8JitahQDj0V9p2cOoD4cQX+Q=";
    };

    ".config/bat/themes/catppuccin-mocha.tmTheme".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
      hash = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
    };

    ".config/qutebrowser/config.py".source = ./programs/qutebrowser.py;

    ".config/ohmyposh/config.toml".source = ./programs/oh-my-posh.toml;
  };
}
