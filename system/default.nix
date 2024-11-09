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
    buildInputs = old.buildInputs ++ [pkgs.harfbuzz];
    patches = [
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
        hash = "sha256-kFmGCrsqiphY1uiRCX/Gz4yOdlLxIIHBlsM1pvW5TTA=";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/undercurl/st-undercurl-0.9-20240103.diff";
        hash = "sha256-9ReeNknxQJnu4l3kR+G3hfNU+oxGca5agqzvkulhaCg=";
      })
    ];
    configFile = pkgs.writeText "config.def.h" (builtins.readFile "${inputs.suckless}/st.h");
    postPatch = old.postPatch + "cp ${configFile} config.def.h";
  });
  swhkd = pkgs.rustPlatform.buildRustPackage {
    pname = "swhkd";
    version = "1.2.1-unstable-2024-04-06";

    outputs = ["bin" "man" "out"];

    src = pkgs.fetchFromGitHub {
      owner = "waycrate";
      repo = "swhkd";
      rev = "f8519a54900d72492a6c036b32e472c108d44dbf";
      hash = "sha256-zyGyZOG8gAtsRkzSRH1M777fPv1wudbVsBrSTJ5CBnY=";
    };

    nativeBuildInputs = with pkgs; [
      scdoc
      pkg-config
    ];

    postPatch = ''
      sed -ie 's/-o root//' Makefile
    '';

    buildPhase = ''
      runHook preBuild
      make build
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out $bin $man/share
      make DESTDIR=$out MAN1_DIR=/share/man/man1 MAN5_DIR=/share/man/man5 TARGET_DIR=/bin install
      mv $out/bin $bin/bin
      mv $out/share/man $man/share/man
      mv $out/usr/share/polkit-1 $out/share/polkit-1
      rm -r $out/etc $out/usr

      runHook postInstall
    '';

    cargoHash = "sha256-d/61hdyooYuqfOSTUcxVUJVhG98uexgPk7h6N1ptIgQ=";

    buildInputs = with pkgs; [
      systemd
      libgcc
    ];
  };
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
      dwl
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
      oh-my-posh
      qutebrowser
      wl-clipboard
      bibata-cursors
    ]
    ++ [
      st
      dwl
      swhkd
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
