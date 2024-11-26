{
  scheme,
  inputs,
  pkgs,
  lib,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: {
    src = inputs.dwl;
    patches = [
      (
        pkgs.writeText "theme.diff" ''
          --- a/config.def.h
          +++ b/config.def.h
          @@ -10,10 +10,10 @@ static const int smartgaps                 = 0;  /* 1 means no outer gap when th
           static int gaps                            = 1;  /* 1 means gaps between windows are added */
           static const unsigned int gappx            = 10; /* gap pixel between windows */
           static const unsigned int borderpx         = 2;  /* border pixel of windows */
          -static const float rootcolor[]             = COLOR(0x222222ff);
          -static const float bordercolor[]           = COLOR(0x444444ff);
          -static const float focuscolor[]            = COLOR(0x005577ff);
          -static const float urgentcolor[]           = COLOR(0xff0000ff);
          +static const float rootcolor[]             = COLOR(0x${lib.strings.removePrefix "#" scheme.base00}ff);
          +static const float bordercolor[]           = COLOR(0x${lib.strings.removePrefix "#" scheme.base02}ff);
          +static const float focuscolor[]            = COLOR(0x${lib.strings.removePrefix "#" scheme.base04}ff);
          +static const float urgentcolor[]           = COLOR(0x${lib.strings.removePrefix "#" scheme.base08}ff);
           /* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
           static const float fullscreen_bg[]         = {0.1f, 0.1f, 0.1f, 1.0f}; /* You can also use glsl colors */
           static const char *cursor_theme            = "Banana";
        ''
      )
    ];
    passthru.providedSessions = ["dwl"];
    buildInputs = old.buildInputs ++ [pkgs.libdrm pkgs.fcft];
  });
in {
  config = {
    environment.systemPackages = [dwl];

    services.displayManager.sessionPackages = [dwl];
  };
}
