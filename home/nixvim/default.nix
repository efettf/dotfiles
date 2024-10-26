{lib, ...}: {
  imports = [
    {programs.nixvim = lib.importTOML ./options.toml;}
    {programs.nixvim.plugins = lib.importTOML ./plugins.toml;}
    {programs.nixvim.extraConfigVim = builtins.readFile ./options.vim;}
  ];
  programs.nixvim.enable = true;
}
