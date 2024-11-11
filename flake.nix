{
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    wrapper = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    slstatus = {
      url = "github:efettf/slstatus";
      flake = false;
    };

    dmenu = {
      url = "github:efettf/dmenu";
      flake = false;
    };

    dwl = {
      url = "github:efettf/dwl";
      flake = false;
    };

    st = {
      url = "github:efettf/st";
      flake = false;
    };

    wallpapers = {
      url = "github:efettf/dotfiles-wallpapers";
      flake = false;
    };
  };
}
