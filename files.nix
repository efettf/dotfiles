{
  pkgs,
  inputs,
  ...
}: {
  homix = {
    "wallpapers".source = inputs.wallpapers;

    ".config/tmux/tmux.conf".source = ./programs/tmux.conf;
    ".config/tmux/tpm".source = inputs.tpm;

    ".config/hypr/hyprland.conf".source = ./programs/hyprland.conf;

    ".local/share/zinit/zinit.git".source = inputs.zinit;

    ".config/bat/themes/catppuccin-mocha.tmTheme".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
      hash = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
    };

    ".zshrc".source = ./programs/zshrc;

    ".config/ohmyposh/config.toml".source = ./programs/oh-my-posh.toml;
  };
}
