{
  inputs,
  pkgs,
  lib,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: rec {
    src = inputs.dwl;
    passthru.providedSessions = ["dwl"];
    buildInputs = old.buildInputs ++ (with pkgs; [libdrm fcft]);
  });
  st = pkgs.st.overrideAttrs (old: rec {
    src = inputs.st;
    buildInputs = old.buildInputs ++ (with pkgs; [harfbuzz xorg.libXcursor]);
  });
  dmenu = pkgs.dmenu.overrideAttrs rec {src = inputs.dmenu;};
in {
  imports = [(lib.importTOML ./config.toml)];

  environment.systemPackages = with pkgs; [
    gh
    fd
    st
    go
    git
    eza
    fzf
    dwl
    gcc
    pass
    swww
    dmenu
    comma
    direnv
    zoxide
    ripgrep
    undollar
    tealdeer
    alejandra
    wl-clipboard
    doas-sudo-shim
    bibata-cursors
  ];

  environment.variables = {
    "BAT_THEME" = "catppuccin-mocha";
  };

  services.displayManager.sessionPackages = [dwl];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Enable flakes and nix command.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
