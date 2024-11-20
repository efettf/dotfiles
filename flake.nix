{
  outputs = inputs: {
    nixosConfigurations = let
      mkSystem = host:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./bin
            ./user
            ./system
            ./modules
            ./hosts/${host}.nix
            {networking.hostName = host;}
          ];
        };
    in {laptop = mkSystem "laptop";};
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.dwl.url = "github:efettf/dwl";
  inputs.dwl.flake = false;

  inputs.nvim-cmp-path.url = "github:hrsh7th/cmp-path";
  inputs.nvim-cmp-path.flake = false;

  inputs.nvim-cmp-spell.url = "github:f3fora/cmp-spell";
  inputs.nvim-cmp-spell.flake = false;

  inputs.nvim-cmp-treesitter.url = "github:ray-x/cmp-treesitter";
  inputs.nvim-cmp-treesitter.flake = false;

  inputs.nvim-plenary.url = "github:nvim-lua/plenary.nvim";
  inputs.nvim-plenary.flake = false;

  inputs.nvim-cmp.url = "github:hrsh7th/nvim-cmp";
  inputs.nvim-cmp.flake = false;

  inputs.nvim-recorder.url = "github:chrisgrieser/nvim-recorder";
  inputs.nvim-recorder.flake = false;

  inputs.nvim-oil.url = "github:stevearc/oil.nvim";
  inputs.nvim-oil.flake = false;

  inputs.nvim-telescope.url = "github:nvim-telescope/telescope.nvim";
  inputs.nvim-telescope.flake = false;

  inputs.nvim-treesitter.url = "github:nvim-treesitter/nvim-treesitter";
  inputs.nvim-treesitter.flake = false;

  inputs.nvim-whichkey.url = "github:folke/which-key.nvim";
  inputs.nvim-whichkey.flake = false;

  inputs.nvim-autopairs.url = "github:windwp/nvim-autopairs";
  inputs.nvim-autopairs.flake = false;

  inputs.nvim-autosave.url = "github:okuuva/auto-save.nvim";
  inputs.nvim-autosave.flake = false;

  inputs.nvim-base16.url = "github:echasnovski/mini.base16";
  inputs.nvim-base16.flake = false;

  inputs.nvim-gitsigns.url = "github:lewis6991/gitsigns.nvim";
  inputs.nvim-gitsigns.flake = false;

  inputs.nvim-conform.url = "github:stevearc/conform.nvim";
  inputs.nvim-conform.flake = false;

  inputs.nvim-colorizer.url = "github:norcalli/nvim-colorizer.lua";
  inputs.nvim-colorizer.flake = false;

  inputs.nvim-comment.url = "github:numToStr/Comment.nvim";
  inputs.nvim-comment.flake = false;

  inputs.nvim-transparent.url = "github:xiyaowong/transparent.nvim";
  inputs.nvim-transparent.flake = false;

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
