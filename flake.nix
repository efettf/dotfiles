{

  # NOTE: See in ./hosts/default.nix array with includes of modules.
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  # WARNING: Nixos version declared here, don't use version below 24.11!
  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";

  # NOTE: Unfortunetely inputs in flakes doesn't allow for expressions,
  # might write a generator for this in the future, but for now it's manual.

  inputs."qutebrowser".url = "github:efettf/qutebrowser";
  inputs."qutebrowser".inputs."nixpkgs".follows = "nixpkgs";

  inputs."secrets".url = "github:efettf/secrets";
  inputs."secrets".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ncmpcpp".url = "github:efettf/ncmpcpp";
  inputs."ncmpcpp".inputs."nixpkgs".follows = "nixpkgs";

  inputs."system".url = "github:efettf/system";
  inputs."system".inputs."nixpkgs".follows = "nixpkgs";

  inputs."kanata".url = "github:efettf/kanata";
  inputs."kanata".inputs."nixpkgs".follows = "nixpkgs";

  inputs."colors".url = "github:efettf/colors";
  inputs."colors".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nsxiv".url = "github:efettf/nsxiv";
  inputs."nsxiv".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dmenu".url = "github:efettf/dmenu";
  inputs."dmenu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."files".url = "github:efettf/files";
  inputs."files".inputs."nixpkgs".follows = "nixpkgs";

  inputs."gitu".url = "github:efettf/gitu";
  inputs."gitu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."mako".url = "github:efettf/mako";
  inputs."mako".inputs."nixpkgs".follows = "nixpkgs";

  inputs."tmux".url = "github:efettf/tmux";
  inputs."tmux".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nvim".url = "github:efettf/nvim";
  inputs."nvim".inputs."nixpkgs".follows = "nixpkgs";

  inputs."fish".url = "github:efettf/fish";
  inputs."fish".inputs."nixpkgs".follows = "nixpkgs";

  inputs."git".url = "github:efettf/git";
  inputs."git".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dwl".url = "github:efettf/dwl";
  inputs."dwl".inputs."nixpkgs".follows = "nixpkgs";

  inputs."bin".url = "github:efettf/bin";
  inputs."bin".inputs."nixpkgs".follows = "nixpkgs";

  inputs."st".url = "github:efettf/st";
  inputs."st".inputs."nixpkgs".follows = "nixpkgs";
}
