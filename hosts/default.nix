inputs: let
  mkHost = host:
    inputs.nixpkgs.lib.nixosSystem {
      modules =
        [./${host}.nix]
        ++ map (value: inputs.${value}.nixosModules.default)
        (builtins.filter (x: x != "nixpkgs")
          (builtins.attrNames ((import ../flake.nix).inputs)));
    };
in {
  nixos = mkHost "nixos";
}
