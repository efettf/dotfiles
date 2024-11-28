{
  pkgs,
  config,
  ...
}: let
  nsxiv = pkgs.nsxiv.overrideAttrs (old: {preBuild = "cp ${./nsxiv.h} config.def.h";});
in {
  environment.systemPackages = [nsxiv];

  files.".Xresources".text = ''
    Nsxiv.window.background: ${config.scheme.base00}
    Nsxiv.window.foreground: ${config.scheme.base05}
    Nsxiv.bar.background: ${config.scheme.base01}
  '';
}
