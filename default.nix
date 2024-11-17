self:
with self; let
  mkSystem = host: {
    specialArgs = {inherit inputs;};
    modules = [
      ./bin
      ./share
      ./config
      ./hosts/${host}
      ./modules/homix.nix
      {networking.hostName = host;}
    ];
  };
in {nixos = mkSystem "nixos";}
