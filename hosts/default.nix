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

        ../modules/homix.nix
      ];
    };
in {
  nixos = mkSystem "nixos";
}
