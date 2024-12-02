inputs: {
  lib,
  pkgs,
  config,
  ...
}:
with builtins;
with pkgs;
with lib; {
  options.files = mkOption {
    default = {};
    type = types.attrsOf (types.submodule ({
      name,
      config,
      options,
      ...
    }: {
      options = {
        path = mkOption {type = types.str;};
        source = mkOption {type = types.path;};
        text = mkOption {
          default = null;
          type = types.nullOr types.lines;
        };
      };
      config = {
        path = mkDefault name;
        source = mkIf (config.text != null) (
          mkDerivedConfig options.text (writeText ("files-" + replaceStrings ["/"] ["-"] name))
        );
      };
    }));
  };

  config.systemd.services."files" = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      User = config.user;
      ExecStart = writeShellScript "files-link" ''
        ${concatStringsSep "\n" (map (files: ''
          set -eu

          file=$HOME/${files.path}
          [ -d ${files.source} ] && unlink $file
          mkdir -p $(dirname $file)
          diff $file ${files.source} || ln -sf ${files.source} $file
        '') (attrValues config.files))}
      '';
    };
  };
}
