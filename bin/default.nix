{pkgs, ...}:
with pkgs;
with builtins; {
  environment.systemPackages = [
    (writeShellScriptBin "emoji" (readFile ./emoji))
    (writeShellScriptBin "initrepo" (readFile ./initrepo))
    (writeShellScriptBin "wallpaper" (readFile ./wallpaper))
  ];
}
