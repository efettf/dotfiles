{
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  inputs = {
    # 'pkgs' source, you can change system version here.
    nixpkgs.url = "github:nixos/nixpkgs";

    homix.url = "github:efettf/homix.nix";

    # Manage your home directory like nixos.
    home-manager.url = "github:nix-community/home-manager";

    # Make sure to specify all follows here,
    # to make sure flake won't have to download 2 nixpkgs.
    homix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
}
