{pkgs, ...}: {
  environment.systemPackages = [pkgs.bat];
  homix.".config/bat/themes/catppuccin-mocha.tmTheme".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
    hash = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
  };
}
