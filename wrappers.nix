{pkgs, ...}: {
  wrappers.bat = {
    basePackage = pkgs.bat;
    env."BAT_THEME".value = "catppuccin-mocha";
  };

  wrappers.eza = {
    basePackage = pkgs.eza;
    flags = ["--icons=always" "--no-quotes"];
  };
}
