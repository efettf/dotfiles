{ pkgs, ... }: {

  wrappers.bat = {
    basePackage = pkgs.bat;
    env."BAT_THEME".value = "catppuccin-mocha";
  };

  wrappers.alacritty = {
    basePackage = pkgs.alacritty;
    flags = [ "--config-file" ./programs/alacritty.toml ];
  };

  wrappers.qutebrowser = {
    basePackage = pkgs.qutebrowser;
    flags = [ "-C" ./programs/qutebrowser.py ];
  };

  wrappers.eza = {
    basePackage = pkgs.eza;
    flags = [ "--icons=always" "--no-quotes" ];
  };

}
