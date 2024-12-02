inputs: {
  config,
  pkgs,
  ...
}: {
  imports = [inputs.sops.nixosModules.sops];

  config = {
    environment.systemPackages = [
      pkgs.age
      pkgs.sops
    ];

    sops = {
      defaultSopsFile = ./secrets/accounts.yaml;

      age.keyFile = "/var/lib/sops-nix/key.txt";

      secrets = {
        "github" = {};
        "proton" = {};
        "reddit" = {};
      };
    };
  };
}
