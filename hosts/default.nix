{self, ...}: let
  inherit (self) inputs;
  mkSystem = host:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        # Nixos specific configurations go here.
        ../system

        ../files.nix

        # Import hardware scan result for host.
        ./${host}.nix

        # Nixos module imports go here.
        inputs.homix.nixosModules.default
        inputs.based.nixosModules.default
      ];
    };
in {
  nixos = mkSystem "nixos";
}
