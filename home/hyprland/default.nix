{lib, ...}: {
  imports = [
    {wayland.windowManager.hyprland.settings = lib.importTOML ./settings.toml;}
  ];

  # Enable hyprland.
  wayland.windowManager.hyprland.enable = true;
}
