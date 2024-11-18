{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (old: rec {
      patches = [
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
          hash = "sha256-kFmGCrsqiphY1uiRCX/Gz4yOdlLxIIHBlsM1pvW5TTA=";
        })
        ./patches/font.diff
        ./patches/theme.diff
      ];
      buildInputs = old.buildInputs ++ [harfbuzz xorg.libXcursor];
    }))
  ];
}
