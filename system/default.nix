{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    {services.kanata.keyboards.main.config = builtins.readFile ./kanata.lisp;}
  ];

  environment.systemPackages = with pkgs; [
    (inputs.wrapper-manager.lib.build { inherit pkgs; modules = [ ../wrappers.nix ]; })
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
          hash = "sha256-kFmGCrsqiphY1uiRCX/Gz4yOdlLxIIHBlsM1pvW5TTA=";
        })
      ];
      configFile = writeText "config.def.h" (builtins.readFile ../programs/st.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))
    gh
    fd
    git
    fzf
    gcc
    pass
    swww
    tmux
    comma
    direnv
    neovim
    zoxide
    ripgrep
    undollar
    tealdeer
    hyprcursor
    oh-my-posh
    qutebrowser
    wl-clipboard
    bibata-cursors
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
