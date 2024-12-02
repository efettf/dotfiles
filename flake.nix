{

  description = "Modular nixos configuration";

  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};

  # WARNING: Nixos version declared here, don't use version below 24.11!
  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";

  inputs."qutebrowser".url = "./modules/qutebrowser";
  inputs."qutebrowser".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ueberzugpp".url = "./modules/ueberzugpp";
  inputs."ueberzugpp".inputs."nixpkgs".follows = "nixpkgs";

  inputs."secrets".url = "./modules/secrets";
  inputs."secrets".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ncmpcpp".url = "./modules/ncmpcpp";
  inputs."ncmpcpp".inputs."nixpkgs".follows = "nixpkgs";

  inputs."console".url = "./modules/console";
  inputs."console".inputs."nixpkgs".follows = "nixpkgs";

  inputs."system".url = "./modules/system";
  inputs."system".inputs."nixpkgs".follows = "nixpkgs";

  inputs."kanata".url = "./modules/kanata";
  inputs."kanata".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nsxiv".url = "./modules/nsxiv";
  inputs."nsxiv".inputs."nixpkgs".follows = "nixpkgs";

  inputs."theme".url = "./modules/theme";
  inputs."theme".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dmenu".url = "./modules/dmenu";
  inputs."dmenu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."files".url = "./modules/files";
  inputs."files".inputs."nixpkgs".follows = "nixpkgs";

  inputs."gitu".url = "./modules/gitu";
  inputs."gitu".inputs."nixpkgs".follows = "nixpkgs";

  inputs."mako".url = "./modules/mako";
  inputs."mako".inputs."nixpkgs".follows = "nixpkgs";

  inputs."tmux".url = "./modules/tmux";
  inputs."tmux".inputs."nixpkgs".follows = "nixpkgs";

  inputs."nvim".url = "./modules/nvim";
  inputs."nvim".inputs."nixpkgs".follows = "nixpkgs";

  inputs."fish".url = "./modules/fish";
  inputs."fish".inputs."nixpkgs".follows = "nixpkgs";

  inputs."git".url = "./modules/git";
  inputs."git".inputs."nixpkgs".follows = "nixpkgs";

  inputs."dwl".url = "./modules/dwl";
  inputs."dwl".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ssh".url = "./modules/ssh";
  inputs."ssh".inputs."nixpkgs".follows = "nixpkgs";

  inputs."bin".url = "./modules/bin";
  inputs."bin".inputs."nixpkgs".follows = "nixpkgs";

  inputs."st".url = "./modules/st";
  inputs."st".inputs."nixpkgs".follows = "nixpkgs";

}
