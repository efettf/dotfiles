{
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./default.toml)
    {services.kanata = lib.importTOML ./kanata.toml;}
  ];

  # Replace sudo with doas completly.
  environment.systemPackages = [(pkgs.writeScriptBin "sudo" ''exec doas "$@"'')];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # User configuration.
  users.users.lynx.packages = with pkgs; [
    git
    eza
    fzf
    pass
    direnv
    zoxide
    ripgrep
    tealdeer
    tmuxifier
    oh-my-posh
    gitmoji-cli
    wl-clipboard
    pinentry-curses
  ];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
