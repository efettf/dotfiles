self:
with self; let
  mkSystem = host:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./share
        ./hosts/${host}
        ./modules/homix.nix
      ];
    };
in {nixos = mkSystem "nixos";}
