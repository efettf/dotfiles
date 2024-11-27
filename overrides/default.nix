{
  lib,
  pkgs,
  scheme,
  inputs,
  ...
}: let
  dmenu = pkgs.dmenu.overrideAttrs {
    src = inputs.dmenu;
    dmenuConfig = with scheme; pkgs.writeText "config.def.h" ''
      static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
      static int draw_input = 1;                  /* -noi option; if 0, the input will not be drawn by default */
      static int centered = 0;                    /* -c option; centers dmenu on screen */
      static int min_width = 250;                    /* minimum width when centered */
      /* -fn option overrides fonts[0]; default X11 font or font set */
      static const char *fonts[] = {
      	"JetBrainsMono Nerd Font:size=10"
      };
      static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
      static const char *colors[SchemeLast][2] = {
      	/*     fg         bg       */
      	[SchemeNorm] = { "${base04}", "${base01}" },
      	[SchemeSel] = { "${base05}", "${base03}" },
      	[SchemeSelHighlight] = { "${base0A}", "${base03}" },
      	[SchemeNormHighlight] = { "${base05}", "${base01}" },
      	[SchemeOut] = { "${base00}", "${base05}" },
        [SchemeCursor] = { "${base03}", "${base03}"},
      };
      /* -l and -g options; controls number of lines and columns in grid if > 0 */
      static unsigned int lines      = 0;
      static unsigned int columns    = 0;

      /*
       * Characters not considered part of a word while deleting words
       * for example: " /?\"&[]"
       */
      static const char worddelimiters[] = " ";

      /*
       * -vi option; if nonzero, vi mode is always enabled and can be
       * accessed with the global_esc keysym + mod mask
       */
      static unsigned int vi_mode = 0;
      static unsigned int start_mode = 1;			/* mode to use when -vi is passed. 0 = insert mode, 1 = normal mode */
      static Key global_esc = { XK_n, Mod1Mask };	/* escape key when vi mode is not enabled explicitly */
      static Key quit_keys[] = {
        /* keysym	modifier */
        { XK_q,		0 }
      };

      /* Size of the window border */
      static unsigned int border_width = 2;
    '';
    preBuild = "cp $dmenuConfig config.def.h";
  };
  nsxiv = pkgs.nsxiv.overrideAttrs (old: {preBuild = "cp ${./nsxiv.h} config.def.h";});
  st = pkgs.st.overrideAttrs (old: {
    src = inputs.st;
    patches = [
      (with scheme;
        pkgs.writeText "theme.diff" ''
          --- a/config.def.h
          +++ b/config.def.h
          @@ -96,43 +96,39 @@
           /* Terminal colors (16 first used in escape sequence) */
           static const char *colorname[] = {
           	/* 8 normal colors */
          -	"black",
          -	"red3",
          -	"green3",
          -	"yellow3",
          -	"blue2",
          -	"magenta3",
          -	"cyan3",
          -	"gray90",
          +	"${base03}",
          +	"${base08}",
          +	"${base0B}",
          +	"${base0A}",
          +	"${base0D}",
          +	"${base0E}",
          +	"${base0C}",
          +	"${base05}",

           	/* 8 bright colors */
          -	"gray50",
          -	"red",
          -	"green",
          -	"yellow",
          -	"#5c5cff",
          -	"magenta",
          -	"cyan",
          -	"white",
          +	"${base04}",
          +	"${base08}",
          +	"${base0B}",
          +	"${base0A}",
          +	"${base0D}",
          +	"${base0E}",
          +	"${base0C}",
          +	"${base05}",
          +
          +   [256] = "${base05}", /* default foreground colour */
          +   [257] = "${base00}", /* default background colour */
          +   [258] = "${base06}", /*575268*/

          -	[255] = 0,
          -
          -	/* more colors can be added after 255 to use with DefaultXX */
          -	"#cccccc",
          -	"#555555",
          -	"gray90", /* default foreground colour */
          -	"black", /* default background colour */
           };

          -
           /*
            * Default colors (colorname index)
            * foreground, background, cursor, reverse cursor
            */
          -unsigned int defaultfg = 258;
          -unsigned int defaultbg = 259;
          -unsigned int defaultcs = 256;
          -static unsigned int defaultrcs = 257;
          +unsigned int defaultfg = 256;
          +unsigned int defaultbg = 257;
          +unsigned int defaultcs = 258;
          +static unsigned int defaultrcs = 258;

           /*
            * Default shape of cursor
        '')
    ];
    buildInputs = old.buildInputs ++ [pkgs.harfbuzz pkgs.xorg.libXcursor];
  });
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
  environment.systemPackages = [st nsxiv dwl dmenu];
  services.displayManager.sessionPackages = [dwl];

  files.".Xresources".text = with scheme; ''
    Nsxiv.window.background: ${base00}
    Nsxiv.window.foreground: ${base05}
    Nsxiv.bar.background: ${base01}
  '';
}
