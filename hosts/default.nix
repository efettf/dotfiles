inputs: let
  mkHost = host:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules =
        [./${host}.nix]
        ++ map (value: inputs.${value}.nixosModules.default) [
          "qutebrowser"
          "secrets"
          "ncmpcpp"
          "kanata"
          "system"
          "colors"
          "nsxiv"
          "dmenu"
          "xmenu"
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
