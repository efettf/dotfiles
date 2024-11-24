{
  pkgs,
  lib,
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
    ./dwl
    ./tty
    ./git
    ./st
  ];

  environment.systemPackages = with pkgs; [
    gh
    fd
    fzf
    eza
    swww
    comma
    tealdeer
    wlsunset
  ];
}
