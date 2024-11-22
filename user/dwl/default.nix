{
  inputs,
  scheme,
  pkgs,
  lib,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: {
    patches = with inputs; [
      dwl-gaps
      dwl-autostart
      dwl-warpcursor
      dwl-cursortheme
      ./patches/keys.diff
      ./patches/cursor.diff
      ./patches/autostart.diff
      (with scheme;
        pkgs.writeText "theme.diff" ''
          --- a/config.def.h
          +++ b/config.def.h
          @@ -9,11 +9,11 @@ static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will
           static const int smartgaps                 = 0;  /* 1 means no outer gap when there is only one window */
           static int gaps                            = 1;  /* 1 means gaps between windows are added */
           static const unsigned int gappx            = 10; /* gap pixel between windows */
          -static const unsigned int borderpx         = 1;  /* border pixel of windows */
          -static const float rootcolor[]             = COLOR(0x222222ff);
          -static const float bordercolor[]           = COLOR(0x444444ff);
          -static const float focuscolor[]            = COLOR(0x005577ff);
          -static const float urgentcolor[]           = COLOR(0xff0000ff);
          +static const unsigned int borderpx         = 2;  /* border pixel of windows */
          +static const float rootcolor[]             = COLOR(0x${lib.strings.removePrefix "#" base00}ff);
          +static const float bordercolor[]           = COLOR(0x${lib.strings.removePrefix "#" base02}ff);
          +static const float focuscolor[]            = COLOR(0x${lib.strings.removePrefix "#" base04}ff);
          +static const float urgentcolor[]           = COLOR(0x${lib.strings.removePrefix "#" base08}ff);
           /* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
           static const float fullscreen_bg[]         = {0.1f, 0.1f, 0.1f, 1.0f}; /* You can also use glsl colors */
           static const char *cursor_theme            = NULL;
        '')
    ];
    passthru.providedSessions = lib.singleton "dwl";
    buildInputs = old.buildInputs ++ (with pkgs; [libdrm fcft]);
  });
in {
  environment.systemPackages = [
    dwl
    pkgs.wl-clipboard
  ];

  services.displayManager.sessionPackages = lib.singleton dwl;
}
