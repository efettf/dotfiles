{
  outputs = inputs: {
    nixosConfigurations = let
      mkHost = name:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules =
            [./hosts/${name}.nix]
            ++ map (name: inputs.${name}.nixosModules.default) [
              "qutebrowser"
              "secrets"
              "ncmpcpp"
              "system"
              "colors"
              "nsxiv"
              "dmenu"
              "files"
              "gitu"
              "mako"
              "tmux"
              "nvim"
              "fish"
              "git"
              "dwl"
              "bin"
              "st"
            ];
        };
    in {
      nixos = mkHost "nixos";
    };
  };

  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";

  inputs."qutebrowser".url = "github:efettf/qutebrowser";
  inputs."qutebrowser".inputs."nixpkgs".follows = "nixpkgs";

  inputs."secrets".url = "github:efettf/secrets";
  inputs."secrets".inputs."nixpkgs".follows = "nixpkgs";

  inputs."ncmpcpp".url = "github:efettf/ncmpcpp";
  inputs."ncmpcpp".inputs."nixpkgs".follows = "nixpkgs";

  inputs."system".url = "github:efettf/system";
  inputs."system".inputs."nixpkgs".follows = "nixpkgs";

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
