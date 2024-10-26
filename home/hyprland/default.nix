{lib, ...}: {
  imports = [
    {wayland.windowManager.hyprland.settings = lib.importTOML ./config.toml;}
  ];

  # Enable hyprland.
  wayland.windowManager.hyprland.enable = true;
}
