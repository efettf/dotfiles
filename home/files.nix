{ pkgs, ...}: {
  home.file."wallpapers".source = pkgs.fetchgit {
    url = "https://github.com/efettf/wallpapers";
    hash = "sha256-45hSUUaoDo4iU+FoTmbdyrHXUdGJXhSF05VP1Ib0oU4=";
  };
}
