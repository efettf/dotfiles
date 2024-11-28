{pkgs, ...}: {
  environment.systemPackages = map (name: pkgs.writeShellScriptBin name (builtins.readFile ./${name}.sh)) [
    "mpdmenu"
    "doasedit"
    "wallpaper"
    "screenshot"
    "musicsearch"
  ];
}
