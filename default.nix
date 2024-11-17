self:
with self; let
  mkSystem = host: {
    specialArgs = {inherit inputs;};
    modules = [
      ./bin
      ./user
      ./system
      ./modules
      ./hosts/${host}.nix
      {networking.hostName = host;}
    ];
  };
in {laptop = mkSystem "laptop";}
