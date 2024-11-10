{
  inputs,
  pkgs,
  lib,
  ...
}: let
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
  dmenu = pkgs.dmenu.overrideAttrs rec {src = inputs.dmenu;};
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
