{
  inputs,
  pkgs,
  lib,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: rec {
    patches = [
      (pkgs.fetchpatch {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/gaps/gaps.patch";
        hash = "sha256-6knXrYblzaqjy5ZG8YG2VKwHeaHB+rij+8ZxXe5LqTE=";
      })
      (pkgs.fetchpatch {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/warpcursor/warpcursor.patch";
        hash = "sha256-0AGMq507WmW2QJW02u6eJDuQmGBAiVPbEw79npwqEDU=";
      })
      (pkgs.fetchpatch {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/alwayscenter/alwayscenter.patch";
        hash = "sha256-JaM/YAXioRi16TRKLvDvHAsn4HQ9jpaBAhvHyp/r/+I=";
      })
    ];
    configFile = pkgs.writeText "config.def.h" (builtins.readFile "${inputs.suckless}/dwl.h");
    postPatch = old.postPatch + "cp ${configFile} config.def.h";
    passthru.providedSessions = ["dwl"];
  });
  st = pkgs.st.overrideAttrs (old: rec {
    src = inputs.st;
    buildInputs = old.buildInputs ++ [pkgs.harfbuzz];
  });
in {
  imports = [
    (lib.importTOML ./config.toml)
    {services.kanata.keyboards.main.config = builtins.readFile ./kanata.lisp;}
  ];

  environment.systemPackages = with pkgs;
    [
      (inputs.wrapper-manager.lib.build {
        inherit pkgs;
        modules = [../wrappers.nix];
      })
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
      alejandra
      oh-my-posh
      qutebrowser
      wl-clipboard
      bibata-cursors
    ]
    ++ [
      st
      dwl
    ];

  services.displayManager.sessionPackages = [dwl];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
