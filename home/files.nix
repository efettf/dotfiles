{ pkgs, ...}: {
  home.file."wallpapers".source = pkgs.fetchgit {
    url = "https://github.com/efettf/wallpapers";
    hash = "sha256-WGlOSloUGXO2EWa92EK+nSBlMK84rXideldsGtTkG5c=";
  };
}
