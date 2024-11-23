{
  variables,
  pkgs,
  lib,
  ...
}: let
  conImport = list:
    map (
      name: {
        imports =
          if variables.programs.${name} == true
          then lib.singleton ./${name}
          else [];
      }
    )
    list;
in {
  imports =
    lib.singleton (lib.importTOML ./config.toml)
    ++ conImport [
      "qutebrowser"
      "kanata"
      "fish"
      "tmux"
      "nvim"
      "gitu"
      "dwl"
      "git"
      "st"
    ];

  environment.systemPackages = with pkgs; [
    gh
    fd
    go
    fzf
    eza
    pass
    swww
    comma
    delta
    tealdeer
    bibata-cursors
  ];
}
