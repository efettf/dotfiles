{
  inputs,
  pkgs,
  lib,
  ...
}: let
  getDmenuPatch = {
    url,
    hash,
  }:
    pkgs.fetchpatch {
      url = "https://raw.githubusercontent.com/efettf/dmenu-patches/refs/heads/main/${url}.diff";
      inherit hash;
    };
  dwl = pkgs.dwl.overrideAttrs (old: rec {
    src = inputs.dwl;
    passthru.providedSessions = ["dwl"];
    buildInputs = old.buildInputs ++ [pkgs.libdrm pkgs.fcft];
  });
  slstatus = pkgs.slstatus.overrideAttrs rec {src = inputs.slstatus;};
  st = pkgs.st.overrideAttrs (old: rec {
    src = inputs.st;
    buildInputs = old.buildInputs ++ [pkgs.harfbuzz pkgs.xorg.libXcursor];
  });
  dmenu = pkgs.dmenu.overrideAttrs (old: rec {
    patches = [
      (getDmenuPatch {
        url = "grid/dmenu-grid-4.9";
        hash = "sha256-8XKruOAX/J8FxfLJPaIQ5nZjBxvJNWJ6hboZXoXvziY=";
      })
      (getDmenuPatch {
        url = "fuzzymatch/dmenu-fuzzymatch-5.3";
        hash = "sha256-eMLMgMhR3BuOG/pcEJdkouh/HvELwjKs9vpM3BBl/Wc=";
      })
      (getDmenuPatch {
        url = "center/dmenu-center-5.2";
        hash = "sha256-qfPInuNejJE3jXchVXlRMCmzbgKJkzdNKLP9hCzSCsU=";
      })
    ];
    configFile = pkgs.writeText "config.def.h" (builtins.readFile ../programs/dmenu.h);
    postPatch = old.postPatch + "cp ${configFile} config.def.h";
  });
in {
  imports = [
    (lib.importTOML ./config.toml)
    {services.kanata.keyboards.main.config = builtins.readFile ./kanata.lisp;}
  ];

  environment.systemPackages = with pkgs;
    [
      (inputs.wrapper.lib.build {
        inherit pkgs;
        specialArgs = {
          inherit dwl;
          inherit slstatus;
        };
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
      hyprland
      undollar
      xwayland
      tealdeer
      alejandra
      hyprcursor
      oh-my-posh
      qutebrowser
      wl-clipboard
      bibata-cursors
    ]
    ++ [
      st
      dwl
      dmenu
      slstatus
    ];

  services.displayManager.sessionPackages = [dwl pkgs.hyprland];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
