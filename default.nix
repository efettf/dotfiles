self:
with self; let
  mkSystem = host: {
    specialArgs = {inherit inputs;};
    modules = [./share ./hosts/${host} ./modules/homix.nix {networking.hostName = host;}];
  };
in {nixos = mkSystem "nixos";}
