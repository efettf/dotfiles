{
  outputs = inputs: {
    nixosModules.default = import ./. inputs;
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  inputs.autosave.url = "github:pocco81/auto-save.nvim";
  inputs.autosave.flake = false;

  inputs.sentiment.url = "github:utilyre/sentiment.nvim";
  inputs.sentiment.flake = false;

  inputs.recorder.url = "github:chrisgrieser/nvim-recorder";
  inputs.recorder.flake = false;

  inputs.alternatetoggler.url = "github:rmagatti/alternate-toggler";
  inputs.alternatetoggler.flake = false;

  inputs.base16.url = "github:echasnovski/mini.base16";
  inputs.base16.flake = false;
}
