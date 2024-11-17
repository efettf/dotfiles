self:
with self; let
  mkSystem = host: {
    specialArgs = {inherit inputs;};
    modules = [
      ./bin
      ./user
      ./system
      ./hosts/${host}
      ./modules/files.nix
      {networking.hostName = host;}
    ];
  };
in {laptop = mkSystem "laptop";}
