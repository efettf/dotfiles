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

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    system.url = "github:efettf/system";
    system.inputs.nixpkgs.follows = "nixpkgs";

    secrets.url = "github:efettf/secrets";
    secrets.inputs.nixpkgs.follows = "nixpkgs";

    qutebrowser.url = "github:efettf/qutebrowser";
    qutebrowser.inputs.nixpkgs.follows = "nixpkgs";

    tmux.url = "github:efettf/tmux";
    tmux.inputs.nixpkgs.follows = "nixpkgs";

    bin.url = "github:efettf/bin";
    bin.inputs.nixpkgs.follows = "nixpkgs";

    mako.url = "github:efettf/mako";
    mako.inputs.nixpkgs.follows = "nixpkgs";

    nvim.url = "github:efettf/nvim";
    nvim.inputs.nixpkgs.follows = "nixpkgs";

    ncmpcpp.url = "github:efettf/ncmpcpp";
    ncmpcpp.inputs.nixpkgs.follows = "nixpkgs";

    git.url = "github:efettf/git";
    git.inputs.nixpkgs.follows = "nixpkgs";

    gitu.url = "github:efettf/gitu";
    gitu.inputs.nixpkgs.follows = "nixpkgs";

    fish.url = "github:efettf/fish";
    fish.inputs.nixpkgs.follows = "nixpkgs";

    files.url = "github:efettf/files";
    files.inputs.nixpkgs.follows = "nixpkgs";

    colors.url = "github:efettf/colors";
    colors.inputs.nixpkgs.follows = "nixpkgs";

    nsxiv.url = "github:efettf/nsxiv";
    nsxiv.inputs.nixpkgs.follows = "nixpkgs";

    dmenu.url = "github:efettf/dmenu";
    dmenu.inputs.nixpkgs.follows = "nixpkgs";

    dwl.url = "github:efettf/dwl";
    dwl.inputs.nixpkgs.follows = "nixpkgs";

    st.url = "github:efettf/st";
    st.inputs.nixpkgs.follows = "nixpkgs";
  };
}
