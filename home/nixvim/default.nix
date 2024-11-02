{
  lib,
  pkgs,
  ...
}: let
  mkPlugin = {
    user ? "efettf",
    repo,
    hash,
  }:
    pkgs.vimUtils.buildVimPlugin {
      pname = repo;
      version = "1.0";
      src = pkgs.fetchgit {
        url = "https://github.com/${user}/${repo}";
        inherit hash;
      };
    };
  cmp-emoji = mkPlugin {
    repo = "cmp-emoji.nvim";
    hash = "sha256-YOgwJ4oEbTsw6/73Ex9XfcaQeKaGJ9fJdv367IOXa1Q=";
  };
  recorder = mkPlugin {
    user = "chrisgrieser";
    repo = "nvim-recorder";
    hash = "sha256-7Uzd1SHuMjdVmqvjnktdW5jiIvdgP7L3AIIFFOFDngA=";
  };
in {
  imports = [
    {programs.nixvim = lib.importTOML ./config.toml;}
    {programs.nixvim.plugins = lib.importTOML ./plugins.toml;}
    {programs.nixvim.extraConfigVim = builtins.readFile ./extra.vim;}
  ];
  programs.nixvim = {
    enable = true;
    plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      markdown
      regex
      toml
      bash
      yaml
      lua
      nix
      vim
    ];
    extraPlugins = [
      cmp-emoji
      recorder
    ];
    extraConfigLua = ''
      require("recorder").setup({})
    '';
  };
}
