{pkgs, ...}:
with pkgs;
with builtins; {
  imports = [./emoji];
  environment.systemPackages = [
    (writeShellScriptBin "initrepo" (readFile ./initrepo.sh))
    (writeShellScriptBin "wallpaper" (readFile ./wallpaper.sh))
  ];
}
