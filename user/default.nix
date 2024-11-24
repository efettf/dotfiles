{pkgs, ...}: {
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
