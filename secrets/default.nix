# https://inv.nadeko.net/watch?v=G5f6GC7SnhU
# https://github.com/Mic92/sops-nix
{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops.nixosModules.sops];

  environment.systemPackages = [
    pkgs.age
    pkgs.sops
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;

    age.keyFile = "/var/lib/sops-nix/key.txt";

    secrets = {
      "github" = {};
      "proton" = {};
    };
  };
}
