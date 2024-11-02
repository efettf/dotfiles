{
  outputs = inputs: { nixosConfigurations = import ./hosts inputs; };

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
}
