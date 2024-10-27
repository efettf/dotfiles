{
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    {services.kanata.keyboards.main.config = builtins.readFile ./kanata.lisp;}
  ];

  # Replace sudo with doas completly.
  environment.systemPackages = [(pkgs.writeScriptBin "sudo" ''exec doas "$@"'')];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # Packages for specific user.
  users.users.lynx.packages = with pkgs; [
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
    tmuxifier
    alejandra
    oh-my-posh
    gitmoji-cli
    wl-clipboard
    pinentry-curses
  ];

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
