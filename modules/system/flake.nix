{
  outputs = inputs: {
    nixosModules.default = import ./. inputs;
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.nix-index.url = "github:nix-community/nix-index-database";
  inputs.nix-index.inputs.nixpkgs.follows = "nixpkgs";
}
