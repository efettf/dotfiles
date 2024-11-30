{

  description = "Modular nixos configuration";

  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  # WARNING: Nixos version declared here, don't use version below 24.11!
  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";

  inputs."qutebrowser".url = "github:efnnix/qutebrowser";
  inputs."qutebrowser".inputs."nixpkgs".follows = "nixpkgs";

  inputs."secrets".url = "github:efnnix/secrets";
  inputs."secrets".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ncmpcpp".url = "github:efnnix/ncmpcpp";
  inputs."ncmpcpp".inputs."nixpkgs".follows = "nixpkgs";

  inputs."console".url = "github:efnnix/console";
  inputs."console".inputs."nixpkgs".follows = "nixpkgs";

  inputs."system".url = "github:efnnix/system";
  inputs."system".inputs."nixpkgs".follows = "nixpkgs";

  inputs."kanata".url = "github:efnnix/kanata";
  inputs."kanata".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nsxiv".url = "github:efnnix/nsxiv";
  inputs."nsxiv".inputs."nixpkgs".follows = "nixpkgs";

  inputs."theme".url = "github:efnnix/theme";
  inputs."theme".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dmenu".url = "github:efnnix/dmenu";
  inputs."dmenu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."xmenu".url = "github:efnnix/xmenu";
  inputs."xmenu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."files".url = "github:efnnix/files";
  inputs."files".inputs."nixpkgs".follows = "nixpkgs";

  inputs."gitu".url = "github:efnnix/gitu";
  inputs."gitu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."mako".url = "github:efnnix/mako";
  inputs."mako".inputs."nixpkgs".follows = "nixpkgs";

  inputs."tmux".url = "github:efnnix/tmux";
  inputs."tmux".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nvim".url = "github:efnnix/nvim";
  inputs."nvim".inputs."nixpkgs".follows = "nixpkgs";

  inputs."fish".url = "github:efnnix/fish";
  inputs."fish".inputs."nixpkgs".follows = "nixpkgs";

  inputs."git".url = "github:efnnix/git";
  inputs."git".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dwl".url = "github:efnnix/dwl";
  inputs."dwl".inputs."nixpkgs".follows = "nixpkgs";

  inputs."bin".url = "github:efnnix/bin";
  inputs."bin".inputs."nixpkgs".follows = "nixpkgs";

  inputs."st".url = "github:efnnix/st";
  inputs."st".inputs."nixpkgs".follows = "nixpkgs";

}
