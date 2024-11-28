{
  lib,
  pkgs,
  config,
  ...
}:
with builtins;
with pkgs;
with lib;
with types; {
  options.files = mkOption {
    default = {};
    type = attrsOf (submodule ({
      name,
      config,
      options,
      ...
    }: {
      options = {
        path = mkOption {
          type = str;
          description = ''
            Path to the file relative to the $HOME directory.
            If not defined, name of attribute set will be used.
          '';
        };
        source = mkOption {
          type = path;
          description = "Path of the source file or directory.";
        };
        text = mkOption {
          default = null;
          type = nullOr lines;
          description = "Text of the file.";
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
    wantedBy = lib.singleton "multi-user.target";
    serviceConfig = {
      Type = "oneshot";
      User = config.user;
      ExecStart = writeShellScript "files-link" ''
        ${concatStringsSep "\n" (map (f: ''
          FILE=$HOME/${f.path}
          [[ -d ${f.source} ]] && rm $FILE
          mkdir -p $(dirname $FILE)
          diff $FILE ${f.source} || ln -sf ${f.source} $FILE
        '') (attrValues config.files))}
      '';
    };
  };
}
