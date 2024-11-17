{
  pkgs,
  inputs,
  ...
}: let
  dmenu = pkgs.dmenu.overrideAttrs rec {src = inputs.dmenu;};
in {
  environment.systemPackages = [dmenu];
}
