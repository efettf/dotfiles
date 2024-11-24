# https://inv.nadeko.net/watch?v=G5f6GC7SnhU
{
  settings,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = lib.singleton inputs.sops.nixosModules.sops;

  environment.systemPackages = [
    pkgs.age
    pkgs.sops
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/${settings.user}/.config/sops/age/keys.txt";

    secrets = {
      "github" = {};
      "proton" = {};
    };
  };
}
