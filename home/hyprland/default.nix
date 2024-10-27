{lib, config, ...}: {
  imports = [
    {wayland.windowManager.hyprland.settings = lib.importTOML ./config.toml;}
  ];

  wayland.windowManager.hyprland.settings.general."col.inactive_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base01})";
  wayland.windowManager.hyprland.settings.general."col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base04})";

  # Enable hyprland.
  wayland.windowManager.hyprland.enable = true;
}
