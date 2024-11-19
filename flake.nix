{
  outputs = inputs: with inputs; flakelight ./. {nixosConfigurations = import ./.;};

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.flakelight.url = "github:nix-community/flakelight";
  inputs.flakelight.inputs.nixpkgs.follows = "nixpkgs";

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;

  inputs.fish-transient.url = "github:zzhaolei/transient.fish";
  inputs.fish-transient.flake = false;

  inputs.fish-sponge.url = "github:meaningful-ooo/sponge";
  inputs.fish-sponge.flake = false;

  inputs.fish-puffer.url = "github:nickeb96/puffer-fish";
  inputs.fish-puffer.flake = false;

  inputs.fish-zoxide.url = "github:kidonng/zoxide.fish";
  inputs.fish-zoxide.flake = false;

  inputs.fish-pisces.url = "github:laughedelic/pisces";
  inputs.fish-pisces.flake = false;

  inputs.st-ligatures.url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
  inputs.st-ligatures.flake = false;
}
