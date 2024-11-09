{
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    homix = {
      url = "github:efettf/homix.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    suckless = {
      url = "github:efettf/suckless";
      flake = false;
    };

    base = {
      url = "github:efettf/dotfiles-base";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:efettf/wallpapers";
      flake = false;
    };
  };
}
