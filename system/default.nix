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
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
    (inputs.wrapper-manager.lib.build {
      inherit pkgs;
      modules = [{
        wrappers.bat = {
          basePackage = pkgs.bat;
          env."BAT_THEME".value = "catppuccin-mocha";
        };
        wrappers.eza = {
          basePackage = pkgs.eza;
          flags = [ "--icons=always" "--no-quotes" ];
        };
      }];
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
    neovide
    ripgrep
    undollar
    tealdeer
    alejandra
    alacritty
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
