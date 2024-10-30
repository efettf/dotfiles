{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };

    fonts = {
      sizes = {
        applications = 10;
      };
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    targets.hyprland.enable = false;

    image = pkgs.fetchurl {
      url = "https://github.com/dharmx/walls/blob/main/mountain/a_mountain_with_snow_and_clouds_01.jpg?raw=true";
      hash = "sha256-qsxc3RXHx/kuA3eb5VKJMw2SeKDPiY2QJtn0Z/nu+vU=";
    };
  };
}
