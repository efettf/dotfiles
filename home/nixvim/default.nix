{lib, ...}: {
  imports = [
    {programs.nixvim = lib.importTOML ./config.toml;}
    {programs.nixvim.plugins = lib.importTOML ./plugins.toml;}
    {programs.nixvim.extraConfigVim = builtins.readFile ./extra.vim;}
  ];
  programs.nixvim.enable = true;
}
