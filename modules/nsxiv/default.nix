inputs: {
  config,
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = [(pkgs.nsxiv.overrideAttrs {preBuild = "cp ${./config.h} config.def.h";})];

    files.".Xresources".text = ''
      Nsxiv.window.background: ${config.scheme.base00}
      Nsxiv.window.foreground: ${config.scheme.base05}
      Nsxiv.bar.background:    ${config.scheme.base01}
      Nsxiv.bar.font:          ${config.font.name}
    '';
  };
}
