inputs: {
  config,
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = [
      pkgs.mpd
      pkgs.mpc-cli
      pkgs.ncmpcpp
    ];

    files = {
      ".config/ncmpcpp/bindings".source = ./config/ncmpcpp.binds;
      ".config/mpd/mpd.conf".source = ./config/mpd.conf;
    };
  };
}
