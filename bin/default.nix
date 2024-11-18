{pkgs, ...}:
with pkgs;
with builtins; {
  environment.systemPackages = [
    (writeShellScriptBin "initrepo" (readFile ./initrepo.sh))
    (writeShellScriptBin "wallpaper" (readFile ./wallpaper.sh))
  ];
}
