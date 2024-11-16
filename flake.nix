{
  outputs = inputs: with inputs; flakelight ./. {nixosConfigurations = import ./.;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.flakelight.url = "github:nix-community/flakelight";

  inputs.dmenu.url = "github:efettf/dmenu";
  inputs.dmenu.flake = false;

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;

  inputs.st.url = "github:efettf/st";
  inputs.st.flake = false;

  inputs.walls.url = "github:efettf/walls";
  inputs.walls.flake = false;
}
