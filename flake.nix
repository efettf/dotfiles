{
  outputs = inputs: {
    nixosConfigurations.nixos = let
      variables = inputs.nixpkgs.lib.importTOML ./variables.toml;
    in
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs variables;
          inherit (variables) settings scheme;
        };
        modules = [
          ./bin
          ./config
          ./system
          ./modules
          ./secrets
          ./overrides
        ];
      };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    sops.url = "github:mic92/sops-nix";
    sops.inputs.nixpkgs.follows = "nixpkgs";

    nix-index.url = "github:nix-community/nix-index-database";
    nix-index.inputs.nixpkgs.follows = "nixpkgs";

    dmenu.url = "github:efettf/dmenu";
    dmenu.flake = false;

    dwl.url = "github:efettf/dwl";
    dwl.flake = false;

    st.url = "github:efettf/st";
    st.flake = false;

    nvim-sentiment.url = "github:utilyre/sentiment.nvim";
    nvim-sentiment.flake = false;

    nvim-recorder.url = "github:chrisgrieser/nvim-recorder";
    nvim-recorder.flake = false;

    nvim-alternatetoggler.url = "github:rmagatti/alternate-toggler";
    nvim-alternatetoggler.flake = false;

    nvim-base16.url = "github:echasnovski/mini.base16";
    nvim-base16.flake = false;

    fish-transient.url = "github:zzhaolei/transient.fish";
    fish-transient.flake = false;

    fish-sponge.url = "github:meaningful-ooo/sponge";
    fish-sponge.flake = false;

    fish-puffer.url = "github:nickeb96/puffer-fish";
    fish-puffer.flake = false;

    fish-zoxide.url = "github:kidonng/zoxide.fish";
    fish-zoxide.flake = false;

    fish-pisces.url = "github:laughedelic/pisces";
    fish-pisces.flake = false;

    tmux-yank.url = "github:tmux-plugins/tmux-yank";
    tmux-yank.flake = false;

    tmux-sensible.url = "github:tmux-plugins/tmux-sensible";
    tmux-sensible.flake = false;
  };
}
