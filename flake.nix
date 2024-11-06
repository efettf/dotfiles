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

    based = {
      url = "github:efettf/based.nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:efettf/wallpapers";
      flake = false;
    };

    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;
    };
  };
}
