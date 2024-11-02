{
  pkgs,
  lib,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    ./files.nix
    {services.kanata.keyboards.main.config = builtins.readFile ./kanata.lisp;}
  ];

  # Replace sudo with doas completly.
  environment.systemPackages = [(pkgs.writeScriptBin "sudo" ''exec doas "$@"'')];

  # Set default user shell to zsh.
  users.defaultUserShell = pkgs.zsh;

  # System backup version, to update system see 'flake.nix' instead.
  system.stateVersion = "24.05";
}
