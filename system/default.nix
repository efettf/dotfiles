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
  getDwlPatch = {
    name,
    hash,
  }:
    pkgs.fetchpatch {
      url = "https://raw.githubusercontent.com/efettf/dwl-patches/refs/heads/main/${name}/${name}.patch";
      inherit hash;
    };
  dwl = pkgs.dwl.overrideAttrs (old: rec {
    patches = [
      (getDwlPatch {
        name = "cursortheme";
        hash = "sha256-x9sN0cUZbEXyJM/3gQQgZRwVZknjAbvKtm+B41JokII=";
      })
      (getDwlPatch {
        name = "gaps";
        hash = "sha256-6knXrYblzaqjy5ZG8YG2VKwHeaHB+rij+8ZxXe5LqTE=";
      })
      (getDwlPatch {
        name = "warpcursor";
        hash = "sha256-0AGMq507WmW2QJW02u6eJDuQmGBAiVPbEw79npwqEDU=";
      })
      (getDwlPatch {
        name = "alwayscenter";
        hash = "sha256-JaM/YAXioRi16TRKLvDvHAsn4HQ9jpaBAhvHyp/r/+I=";
      })
    ];
    configFile = pkgs.writeText "config.def.h" (builtins.readFile ../programs/dwl.h);
    postPatch = old.postPatch + "cp ${configFile} config.def.h";
    passthru.providedSessions = ["dwl"];
  });
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
    ++ [st dwl dmenu];

  services.displayManager.sessionPackages = [dwl];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
