{
  scheme,
  pkgs,
  lib,
  ...
}: let
  cursor = "Banana";
  patch = hash: name:
    pkgs.fetchpatch {
      url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/${name}/${name}.patch";
      inherit hash;
    };
  dwl = pkgs.dwl.overrideAttrs (old: {
    patches = [
      (patch "sha256-6knXrYblzaqjy5ZG8YG2VKwHeaHB+rij+8ZxXe5LqTE=" "gaps")
      (patch "sha256-OTQ/0O62wG3OKCzA2FGyFpgbNup5Xmia1techndd4I8=" "autostart")
      (patch "sha256-0AGMq507WmW2QJW02u6eJDuQmGBAiVPbEw79npwqEDU=" "warpcursor")
      (patch "sha256-x9sN0cUZbEXyJM/3gQQgZRwVZknjAbvKtm+B41JokII=" "cursortheme")
      ./patches/keys.diff
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
      (pkgs.writeText "theme.diff" ''
        --- a/config.def.h
        +++ b/config.def.h
        @@ -13,8 +13,8 @@ static const float focuscolor[]            = COLOR(0x005577ff);
         static const float urgentcolor[]           = COLOR(0xff0000ff);
         /* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
         static const float fullscreen_bg[]         = {0.1f, 0.1f, 0.1f, 1.0f}; /* You can also use glsl colors */
        -static const char *cursor_theme            = NULL;
        -static const char cursor_size[]            = "24"; /* Make sure it's a valid integer, otherwise things will break */
        +static const char *cursor_theme            = "${
          if cursor == "Banana"
          then "Banana"
          else "Bibata-Modern-Classic"
        }";
        +static const char cursor_size[]            = "${
          if cursor == "Banana"
          then "32"
          else "19"
        }"; /* Make sure it's a valid integer, otherwise things will break */

         /* tagging - TAGCOUNT must be no greater than 31 */
         #define TAGCOUNT (9)
      '')
    ];
    passthru.providedSessions = lib.singleton "dwl";
    buildInputs = old.buildInputs ++ (with pkgs; [libdrm fcft]);
  });
in {
  environment.systemPackages = with pkgs;
    [
      dwl
      wl-clipboard
    ]
    ++ (
      if cursor == "Banana"
      then lib.singleton banana-cursor
      else lib.singleton bibata-cursors
    );

  services.displayManager.sessionPackages = lib.singleton dwl;
}
