{
  config,
  lib,
  pkgs,
  ...
}:
with builtins;
with pkgs;
with lib; {
  options = {
    files = mkOption {
      default = {};
      type = types.attrsOf (types.submodule ({
        name,
        config,
        options,
        ...
      }: {
        options = {
          path = mkOption {
            type = types.str;
            description = ''
              Path to the file relative to the $HOME directory.
              If not defined, name of attribute set will be used.
            '';
          };
          source = mkOption {
            type = types.path;
            description = "Path of the source file or directory.";
          };
          text = mkOption {
            default = null;
            type = types.nullOr types.lines;
            description = "Text of the file.";
          };
        };
        config = {
          path = mkDefault name;
          source = mkIf (config.text != null) (
            let
              name' = "files-" + replaceStrings ["/"] ["-"] name;
            in
              mkDerivedConfig options.text (writeText name')
          );
        };
      }));
    };
    users.users = mkOption {
      type = types.attrsOf (types.submodule {
        options.files = mkEnableOption "Enable homix for selected user";
      });
    };
  };

  config = let
    # List of users managed by files.
    users = attrNames (filterAttrs (name: user: user.files) config.users.users);

    files-link = let
      files = map (f: ''
        FILE=$HOME/${f.path}
        [[ -d ${f.source} ]] && rm $FILE
        mkdir -p $(dirname $FILE)
        diff $FILE ${f.source} || ln -sf ${f.source} $FILE
      '') (attrValues config.files);
    in
      writeShellScript "files-link" ''
        #!/bin/sh
        ${concatStringsSep "\n" files}
      '';

    mkService = user: {
      name = "files-" + user;
      value = {
        wantedBy = ["multi-user.target"];
        description = "Setup files environment for ${user}.";
        serviceConfig = {
          Type = "oneshot";
          User = user;
          ExecStart = files-link;
        };
        environment.HOME = config.users.users.${user}.home;
      };
    };

    services = listToAttrs (map mkService users);
  in {
    systemd.services = services;
  };
}
