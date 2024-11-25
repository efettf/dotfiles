{pkgs, ...}: {
  imports = [
    ./dwl
    ./fish
    ./git
    ./gitu
    ./kanata
    ./nvim
    ./qutebrowser
    ./st
    ./tmux
    ./tty
  ];
  config = {
    environment.systemPackages = [
      pkgs.gh
      pkgs.fd
      pkgs.fzf
      pkgs.eza
      pkgs.swww
      pkgs.comma
      pkgs.tealdeer
      pkgs.wlsunset
    ];
    programs.nano.enable = false;
  };
}
