{
  lib,
  pkgs,
  inputs,
  ...
}: let
  dwl = pkgs.dwl.overrideAttrs (old: {
    src = inputs.dwl;
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
