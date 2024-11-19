{
  lib,
  pkgs,
  inputs,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: rec {
    src = inputs.dwl;
    passthru.providedSessions = lib.singleton "dwl";
    buildInputs = old.buildInputs ++ (with pkgs; [libdrm fcft]);
  });
in {
  environment.systemPackages = with pkgs; [
    dwl
    wl-clipboard
  ];

  services.displayManager.sessionPackages = lib.singleton dwl;
}
