{
  scheme,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (old: {
      patches = [
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
          hash = "sha256-kFmGCrsqiphY1uiRCX/Gz4yOdlLxIIHBlsM1pvW5TTA=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.8.4.diff";
          hash = "sha256-DhqbxkG87FsVeridnLidv+u7caBNbroRa2Y3gAYGPU0=";
        })
        ./patches/font.diff
        ./patches/cursor.diff
        (with scheme;
          writeText "theme.diff" ''
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
      buildInputs = old.buildInputs ++ [harfbuzz xorg.libXcursor];
    }))
  ];
}
