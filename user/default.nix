{
  lib,
  pkgs,
  ...
}: {
  imports = [
    (lib.importTOML ./config.toml)
    ./qutebrowser
    ./kanata
    ./fish
    ./tmux
    ./nvim
    ./gitu
    ./bat
    ./dwl
    ./st
  ];

  environment.systemPackages = with pkgs; [
    gh
    fd
    go
    fzf
    eza
    pass
    swww
    comma
    tealdeer
    bibata-cursors
  ];
}
