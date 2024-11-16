{
  pkgs,
  dwl,
  ...
}:
with pkgs; {
  wrappers.bat = {
    basePackage = bat;
    env."BAT_THEME".value = "catppuccin-mocha";
  };

  wrappers.dwl = {
    basePackage = dwl;
    flags = ["-s" "swww-daemon"];
    env.WLR_DRM_NO_ATOMIC.value = "1";
  };

  wrappers.eza = {
    basePackage = eza;
    flags = ["--icons=always" "--no-quotes"];
  };
}
