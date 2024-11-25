{
  scheme,
  lib,
  ...
}: {
  programs.hyprland.enable = true;

  files.".config/hypr/hyprland.conf".text =
    builtins.readFile ./hyprland.conf
    + ''
      general {
        border_size=2
        gaps_in=8
        gaps_out=10
        layout=master
        col.inactive_border=rgb(${lib.strings.removePrefix "#" scheme.base02})
        col.active_border=rgb(${lib.strings.removePrefix "#" scheme.base04})
      }
    '';
}
