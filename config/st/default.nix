{
  pkgs,
  inputs,
  ...
}: let
  st = pkgs.st.overrideAttrs (old: rec {
    src = inputs.st;
    buildInputs = old.buildInputs ++ (with pkgs; [harfbuzz xorg.libXcursor]);
  });
in {
  environment.systemPackages = [st];
}
