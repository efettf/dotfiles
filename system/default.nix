{
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
    neovide
    ripgrep
    undollar
    tealdeer
    alejandra
    alacritty
    oh-my-posh
    qutebrowser
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
