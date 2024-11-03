{self, ...}: let
  inherit (self) inputs;
  mkSystem = host:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        # Nixos specific configurations go here.
        ../system

        ../files.nix

        # Import hardware scan result for host.
        ./${host}.nix

        # Nixos module imports go here.
        inputs.home-manager.nixosModules.home-manager
        inputs.homix.nixosModules.default

        {
          home-manager.users.lynx.imports = [
            # Home manager specific configurations go here.
            ../home

            # Home manager module imports go here.
            inputs.stylix.homeManagerModules.stylix
          ];
        }
      ];
    };
in {
  nixos = mkSystem "nixos";
}
