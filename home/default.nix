{
  lib,
  pkgs,
  ...
}: {
  # Make home manager manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./hyprland
    {services.wlsunset = lib.importTOML ./programs/wlsunset.toml;}
    {programs.neovide.settings = lib.importTOML ./programs/neovide.toml;}
  ];

  programs = {
    neovide.enable = true;
  };

  home = {
    username = "lynx";
    homeDirectory = "/home/lynx";

    # Packages for home manager user.
    packages = with pkgs; [
      fd
      git
      eza
      fzf
      bat
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
      alacritty
      oh-my-posh
      qutebrowser
      wl-clipboard
    ];

    # Home manager backup version, to update system see 'flake.nix' instead.
    stateVersion = "24.05";
  };
}
