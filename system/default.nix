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
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
