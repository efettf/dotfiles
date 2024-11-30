inputs: let
  mkHost = host:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules =
        [./${host}.nix]
        ++ map (value: inputs.${value}.nixosModules.default)
        (inputs.nixpkgs.lib.lists.remove "nixpkgs"
          (builtins.attrNames ((import ../flake.nix).inputs)));
    };
in {
  nixos = mkHost "nixos";
}
