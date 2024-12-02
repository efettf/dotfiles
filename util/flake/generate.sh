#!/usr/bin/env sh

set -euo pipefail

touch flake.nix

echo "{" > flake.nix

cat << EOF >> flake.nix
  outputs = inputs: {nixosConfigurations = import ./hosts inputs;};
  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-24.11";
EOF

for module in $(ls modules); do
  echo "  inputs.\"${module}\".url = \"./modules/${module}\";" >> flake.nix
  echo "  inputs.\"${module}\".inputs.nixpkgs.follows = \"nixpkgs\";" >> flake.nix
done

echo "}" >> flake.nix

