{
  pkgs,
  dwl,
  ...
}: {
  wrappers.bat = {
    basePackage = pkgs.bat;
    env."BAT_THEME".value = "catppuccin-mocha";
  };

  wrappers.dwl = {
    basePackage = dwl;
    flags = ["-s" "swww-daemon"];
    env.WLR_DRM_NO_ATOMIC.value = "1";
  };

  wrappers.eza = {
    basePackage = pkgs.eza;
    flags = ["--icons=always" "--no-quotes"];
  };
}
