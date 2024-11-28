inputs: let
  mkHost = name:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules =
        [./${name}.nix]
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
}
