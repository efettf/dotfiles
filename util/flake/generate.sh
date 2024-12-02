#!/usr/bin/env sh

set -euo pipefail

echo "{" > flake.nix

git add flake.nix

echo 'outputs = inputs: {' >> flake.nix

for host in $(ls hosts | xargs basename -s .nix); do

cat << EOF >> flake.nix
  nixosConfigurations.$host = inputs.nixpkgs.lib.nixosSystem {
    modules =
      [./hosts/$host.nix]
      ++ map (value: inputs.\${value}.nixosModules.default)
      (builtins.filter (x: x != "nixpkgs")
        (builtins.attrNames ((import ./flake.nix).inputs)));
  };
EOF

done

echo "};" >> flake.nix

echo 'inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";' >> flake.nix

for module in $(ls modules); do

echo "inputs.\"${module}\".url = \"./modules/${module}\";" >> flake.nix
echo "inputs.\"${module}\".inputs.nixpkgs.follows = \"nixpkgs\";" >> flake.nix

done

echo "}" >> flake.nix

