{pkgs, ...}: let
  impConfig = package: {
    imports = [./${package}];
    environment.systemPackages = [pkgs.${package}];
  };
  genConfig = package: suffix: {
    config = {
      files.".config/${package}/${package}.${suffix}".source = ./${package}.${suffix};
      environment.systemPackages = [pkgs.${package}];
    };
  };
in {
  imports = [
    ./st
    ./dwl
    ./tty
    ./kanata
    (impConfig "git")
    (impConfig "fish")
    (impConfig "tmux")
    (impConfig "neovim")
    (impConfig "qutebrowser")
    (genConfig "gitu" "toml")
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
