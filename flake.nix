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

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    dwl.url = "github:efettf/dwl";
    dwl.flake = false;

    nvim-cmp-lsp.url = "github:hrsh7th/cmp-nvim-lsp";
    nvim-cmp-lsp.flake = false;

    nvim-cmp-path.url = "github:hrsh7th/cmp-path";
    nvim-cmp-path.flake = false;

    nvim-cmp-spell.url = "github:f3fora/cmp-spell";
    nvim-cmp-spell.flake = false;

    nvim-cmp-treesitter.url = "github:ray-x/cmp-treesitter";
    nvim-cmp-treesitter.flake = false;

    nvim-plenary.url = "github:nvim-lua/plenary.nvim";
    nvim-plenary.flake = false;

    nvim-cmp.url = "github:hrsh7th/nvim-cmp";
    nvim-cmp.flake = false;

    nvim-recorder.url = "github:chrisgrieser/nvim-recorder";
    nvim-recorder.flake = false;

    nvim-oil.url = "github:stevearc/oil.nvim";
    nvim-oil.flake = false;

    nvim-telescope.url = "github:nvim-telescope/telescope.nvim";
    nvim-telescope.flake = false;

    nvim-treesitter.url = "github:nvim-treesitter/nvim-treesitter";
    nvim-treesitter.flake = false;

    nvim-lspconfig.url = "github:neovim/nvim-lspconfig";
    nvim-lspconfig.flake = false;

    nvim-whichkey.url = "github:folke/which-key.nvim";
    nvim-whichkey.flake = false;

    nvim-autopairs.url = "github:windwp/nvim-autopairs";
    nvim-autopairs.flake = false;

    nvim-autosave.url = "github:okuuva/auto-save.nvim";
    nvim-autosave.flake = false;

    nvim-base16.url = "github:echasnovski/mini.base16";
    nvim-base16.flake = false;

    nvim-gitsigns.url = "github:lewis6991/gitsigns.nvim";
    nvim-gitsigns.flake = false;

    nvim-conform.url = "github:stevearc/conform.nvim";
    nvim-conform.flake = false;

    nvim-colorizer.url = "github:norcalli/nvim-colorizer.lua";
    nvim-colorizer.flake = false;

    nvim-comment.url = "github:numToStr/Comment.nvim";
    nvim-comment.flake = false;

    nvim-transparent.url = "github:xiyaowong/transparent.nvim";
    nvim-transparent.flake = false;

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

    st-ligatures.url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20240427-0.9.2.diff";
    st-ligatures.flake = false;
  };
}
