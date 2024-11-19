{
  outputs = inputs: with inputs; flakelight ./. {nixosConfigurations = import ./.;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.flakelight.url = "github:nix-community/flakelight";
  inputs.flakelight.inputs.nixpkgs.follows = "nixpkgs";

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;

  inputs.st-ligatures.url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
  inputs.st-ligatures.flake = false;
}
