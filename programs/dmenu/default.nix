inputs: {
  config,
  pkgs,
  ...
}: {
  config.environment.systemPackages = [
    (pkgs.writeScriptBin "dmenu" ''
      exec ${pkgs.dmenu.overrideAttrs {src = ./src;}}/bin/dmenu "$@" \
      -nf  "${config.scheme.base04}" \
      -nb  "${config.scheme.base01}" \
      -sf  "${config.scheme.base05}" \
      -sb  "${config.scheme.base03}" \
      -nhf "${config.scheme.base03}" \
      -nhb "${config.scheme.base01}" \
      -shf "${config.scheme.base0A}" \
      -shb "${config.scheme.base03}" \
      -fn  "${config.font.name}:size=${config.font.size}"
    '')
  ];
}
