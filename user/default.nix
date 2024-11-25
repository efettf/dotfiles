{pkgs, ...}: let
  generateConfig = {
    name,
    import ? false,
    importPath ? ./${name},
    package ? true,
    packageName ? pkgs.${name},
    path ? "${name}/${name}.${format}",
    pathText ? false,
    pathSource ? true,
    pathTextValue ? "",
    pathSourceValue ? ./${name}.${format},
    format,
  }: {
    imports =
      if import == true
      then [importPath]
      else [];
    config = {
      files.".config/${path}" =
        if pathSource == true
        then {source = pathSourceValue;}
        else
          (
            if pathText == true
            then {text = pathSourceValue;}
            else ""
          );
      environment.systemPackages =
        if package == true
        then [packageName]
        else [];
    };
  };
in {
  imports = [
    ./dwl
    ./fish
    ./git
    ./kanata
    ./nvim
    ./qutebrowser
    ./st
    ./tmux
    ./tty
    (
      generateConfig {
        name = "gitu";
        format = "toml";
      }
    )
  ];
  config = {
    environment.systemPackages = [
      pkgs.gh
      pkgs.fd
      pkgs.fzf
      pkgs.eza
      pkgs.swww
      pkgs.comma
      pkgs.tealdeer
      pkgs.wlsunset
    ];
    programs.nano.enable = false;
  };
}
