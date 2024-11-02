{self, ...}: let
  inherit (self) inputs;
  mkSystem = host:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        # Nixos specific configurations go here.
        ../system

        # Import hardware scan result for host.
        ./${host}.nix

        # Nixos module imports go here.
        inputs.home-manager.nixosModules.home-manager
        inputs.index.nixosModules.nix-index

        # Enable comma - run software without installing it.
        {programs.nix-index-database.comma.enable = true;}

        {
          home-manager.users.lynx.imports = [
            # Home manager specific configurations go here.
            ../home

            # Home manager module imports go here.
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
          ];
        }
      ];
    };
in {
  nixos = mkSystem "nixos";
}
