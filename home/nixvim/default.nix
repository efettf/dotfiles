{
  lib, 
  pkgs, 
  ... 
}: let
  cmp-emoji = pkgs.vimUtils.buildVimPlugin {
    pname = "cmp-emoji";
    version = "1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/efettf/cmp-emoji.nvim";
      hash = "sha256-AESd8x6IdlVeGMIzjbbfG0aYHvIaQTGkxa2Xh8lhC5Y=";
    };
  };
  recorder = pkgs.vimUtils.buildVimPlugin {
    pname = "recorder";
    version = "1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/chrisgrieser/nvim-recorder";
      hash = "sha256-7Uzd1SHuMjdVmqvjnktdW5jiIvdgP7L3AIIFFOFDngA=";
    };
  };
in {
  imports = [
    {programs.nixvim = lib.importTOML ./config.toml;}
    {programs.nixvim.plugins = lib.importTOML ./plugins.toml;}
    {programs.nixvim.extraConfigVim = builtins.readFile ./extra.vim;}
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = [
      cmp-emoji
      recorder
    ];
    extraConfigLua = ''
      require("recorder").setup({})
    '';
  };
}
