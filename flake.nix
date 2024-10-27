{
  inputs = {

    # 'pkgs' source, you can change system version here.
    nixpkgs.url = "github:nixos/nixpkgs";

    # Manage style of your desktop to be uniform.
    stylix.url = "github:danth/stylix/release-24.05";

    # Database for comma.
    index.url = "github:nix-community/nix-index-database";

    # Manage your neovim config like nixos.
    nixvim.url = "github:nix-community/nixvim";

    # Manage your home directory like nixos.
    home-manager.url = "github:nix-community/home-manager";

    # Make sure to specify all follows here,
    # to make sure flake won't have to download 2 nixpkgs.
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      modules = [

        # Nixos specific configurations go here.
        ./system

        # Import hardware scan result, you can generate it by running:
        # 'nixos-generate-config --show-hardware-config > hardware.nix',
        # while being in the configuration directory.
        ./hardware.nix

        # Nixos module imports go here.
        inputs.home-manager.nixosModules.home-manager
        inputs.index.nixosModules.nix-index

        # Enable comma - run software without installing it.
        {programs.nix-index-database.comma.enable = true;}

        {home-manager.users.lynx.imports = [

          # Home manager specific configurations go here.
          ./home

          # Home manager module imports go here.
          inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim

        ];}
      ];
    };
  };
}
