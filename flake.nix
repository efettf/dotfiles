{
  outputs = inputs: with inputs; flakelight ./. {nixosConfigurations = import ./.;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.flakelight.url = "github:nix-community/flakelight";

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;
}
