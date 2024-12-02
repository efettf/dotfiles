{
  outputs = inputs: {
    nixosModules.default = import ./. inputs;
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
}
