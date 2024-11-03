{pkgs, ...}: {
  homix = {
    "wallpapers".source = pkgs.fetchgit {
      url = "https://github.com/efettf/wallpapers";
      hash = "sha256-Rinz1qPIaljSt0/dGb+kZEFGQXcQ855fI4EjZP1m7nM=";
    };
    ".config/nvim/init.lua".source = ./nvim/init.lua;
    ".config/nvim/lua/plugins".source = ./nvim/plugins;
    ".config/ohmyposh/config.toml".source = ./home/programs/oh-my-posh.toml;
  };
}
