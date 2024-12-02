inputs: {
  pkgs,
  config,
  ...
}: {config.environment.systemPackages = map (name: pkgs.writeShellScriptBin name (builtins.readFile ./scripts/${name})) (builtins.attrNames (builtins.readDir ./scripts));}
