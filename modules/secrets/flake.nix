{
  outputs = inputs: {
    nixosModules.default = import ./. inputs;
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.sops.url = "github:mic92/sops-nix";
  inputs.sops.inputs.nixpkgs.follows = "nixpkgs";
}
