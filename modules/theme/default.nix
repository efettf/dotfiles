inputs: {
  lib,
  pkgs,
  ...
}: {
  options = {
    font = lib.mkOption {type = lib.types.attrsOf lib.types.str;};
    scheme = lib.mkOption {type = lib.types.attrsOf lib.types.str;};
  };
  config = {
    font = {
      name = "JetBrainsMono Nerd Font";
      # name = "Monocraft";
      # name = "Cozette";
      size = "10";
    };
    scheme = import ./schemes/catppuccin-mocha-dark.nix;
    fonts.packages = [
      (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
      pkgs.monocraft
      pkgs.cozette
    ];
  };
}
