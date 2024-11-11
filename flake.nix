{
  outputs = inputs: with inputs; flakelight ./. {nixosConfigurations = import ./.;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.flakelight.url = "github:nix-community/flakelight";

  inputs.wrapper.url = "github:viperML/wrapper-manager";
  inputs.wrapper.inputs.nixpkgs.follows = "nixpkgs";

  inputs.slstatus.url = "github:efettf/slstatus";
  inputs.slstatus.flake = false;

  inputs.dmenu.url = "github:efettf/dmenu";
  inputs.dmenu.flake = false;

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;

  inputs.st.url = "github:efettf/st";
  inputs.st.flake = false;

  inputs.wallpapers.url = "github:efettf/dotfiles-wallpapers";
  inputs.wallpapers.flake = false;
}
