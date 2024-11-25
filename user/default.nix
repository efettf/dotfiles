{pkgs, ...}: let
  genConfig = package: path: {
    config = {
      files.".config/${package}/${path}".source = ./${path};
      environment.systemPackages = [pkgs.${package}];
    };
  };
in {
  imports = [
    ./dwl
    ./fish
    ./git
    ./kanata
    ./nvim
    ./qutebrowser
    ./st
    ./tmux
    ./tty
    (genConfig "gitu" "gitu.toml")
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
