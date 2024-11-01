{
  lib,
  pkgs,
  ...
}: {
  # Make home manager manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./files.nix
    ./nixvim
    ./hyprland
    ./stylix.nix
    {services.wlsunset = lib.importTOML ./programs/wlsunset.toml;}
    {programs.qutebrowser = lib.importTOML ./programs/qutebrowser.toml;}
    {programs.neovide.settings = lib.importTOML ./programs/neovide.toml;}
    {programs.tmux.extraConfig = builtins.readFile ./programs/tmux.conf;}
    {programs.hyprlock.settings = lib.importTOML ./programs/hyprlock.toml;}
    {programs.alacritty.settings = lib.importTOML ./programs/alacritty.toml;}
  ];

  programs = {
    bat.enable = true;
    tmux.enable = true;
    neovide.enable = true;
    hyprlock.enable = true;
    alacritty.enable = true;
    qutebrowser.enable = true;
  };

  xdg.configFile."ohmyposh/config.toml".source = ./programs/oh-my-posh.toml;

  home = {
    username = "lynx";
    homeDirectory = "/home/lynx";

    # Packages for home manager user.
    packages = with pkgs; [
      git
      eza
      fzf
      pass
      swww
      direnv
      zoxide
      ripgrep
      undollar
      tealdeer
      alejandra
      oh-my-posh
      gitmoji-cli
      wl-clipboard
    ];

    # Home manager backup version, to update system see 'flake.nix' instead.
    stateVersion = "24.05";
  };
}
