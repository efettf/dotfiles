{lib, ...}: {
  imports = lib.singleton (lib.importTOML ./config.toml);
}
