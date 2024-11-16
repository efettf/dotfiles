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
  imports = [
    ./files.nix
    (lib.importTOML ./config.toml)
    {services.kanata.keyboards.main.config = builtins.readFile ../config/kanata.lisp;}
  ];

  environment.systemPackages = with pkgs; [
    (inputs.wrapper.lib.build {
      inherit pkgs;
      specialArgs = {
        inherit dwl;
      };
      modules = [./wrappers.nix];
    })
    (writeShellScriptBin "sudo" ''exec doas $@'')
    gh
    fd
    st
    git
    fzf
    dwl
    gcc
    pass
    gitu
    fish
    swww
    tmux
    dmenu
    comma
    direnv
    neovim
    zoxide
    ripgrep
    undollar
    tealdeer
    alejandra
    oh-my-posh
    qutebrowser
    wl-clipboard
    bibata-cursors
  ];

  services.displayManager.sessionPackages = [dwl];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # Enable flakes and nix command.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
