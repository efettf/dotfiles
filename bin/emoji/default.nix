{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "emoji" ''
      cat ${./data} | dmenu | cut -d " " -f1 | tr "\n" " " | wl-copy
    '')
  ];
}
