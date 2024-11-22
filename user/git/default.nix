{
  pkgs,
  lib,
  ...
}: {
  files.".gitconfig".text = lib.generators.toGitINI {
    user = {
      email = "efettf@proton.me";
      name = "efettf";
    };

    alias = {
      ls = "log --oneline";
    };

    core = {
      hooksPath = "hooks";
    };

    pull = {
      rebase = true;
    };

    init = {
      defaultBranch = "main";
    };

    credential."https://github.com" = {
      helper = "!/run/current-system/sw/bin/gh auth git-credential";
    };
  };

  environment.systemPackages = lib.singleton pkgs.git;
}
