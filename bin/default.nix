{pkgs, ...}: {
  environment.systemPackages = map (name: pkgs.writeShellScriptBin name (builtins.readFile ./${name}.sh)) [
    "doasedit"
    "initrepo"
    "wallpaper"
  ];
}
