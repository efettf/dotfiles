{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (old: {
      patches = [
        inputs.st-ligatures
        ./patches/font.diff
        ./patches/theme.diff
        ./patches/cursor.diff
      ];
      buildInputs = old.buildInputs ++ [harfbuzz xorg.libXcursor];
    }))
  ];
}
