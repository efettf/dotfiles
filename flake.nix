{
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    homix = {
      url = "github:efettf/homix.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wrapper = {
      url = "github:efettf/wrapper.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    base = {
      url = "github:efettf/dotfiles-base";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:efettf/dotfiles-wallpapers";
      flake = false;
    };
  };
}
