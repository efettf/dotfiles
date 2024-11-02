{pkgs, ...}: {
  homix = {
    "wallpapers".source = pkgs.fetchgit {
      url = "https://github.com/efettf/wallpapers";
      hash = "sha256-cy1st7tYlkkPfrvcg9Eo61q+gsrfr0OZcHyIrZ6RioA=";
    };
    ".config/ohmyposh/config.toml".source = ../home/programs/oh-my-posh.toml;
  };
}
