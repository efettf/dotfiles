{lib, ...}: {
  imports = [
    (lib.importTOML ./config.toml)
    ./qutebrowser
    ./kanata
    ./dmenu
    ./fish
    ./tmux
    ./nvim
    ./gitu
    ./bat
    ./dwl
    ./st
  ];
}
