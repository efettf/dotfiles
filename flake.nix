{
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.homix = {
    url = "github:efettf/homix.nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.wallpapers = {
    url = "github:efettf/wallpapers";
    flake = false;
  };
}
