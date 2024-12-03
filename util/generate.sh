#!/usr/bin/env sh

set -euo pipefail

## Set variables

export NIXOS_VERSION="24.11"


## Generate host

nixos-generate-config --show-hardware-config \
  | sed -e '1,3d' \
  > "hosts/$(hostname).nix"

git add "hosts/$(hostname).nix"


## Generate flake

echo "{" > flake.nix

git add flake.nix

echo 'outputs = inputs: {' >> flake.nix

for host in $(ls hosts | xargs basename -s .nix); do

  echo "
    nixosConfigurations.$host = inputs.nixpkgs.lib.nixosSystem { modules =
      [./hosts/$host.nix]
      ++ [{config.networking.hostName = \"$host\";}]
      ++ map (value: inputs.\${value}.nixosModules.default)
      (builtins.filter (x: x != \"nixpkgs\")
        (builtins.attrNames ((import ./flake.nix).inputs)));
    };
  " >> flake.nix

done

echo "};" >> flake.nix

echo "inputs.\"nixpkgs\".url = \"github:nixos/nixpkgs/nixos-$NIXOS_VERSION\";" >> flake.nix

modularize() {

  for module in $(ls $1); do

    echo "inputs.\"${module}\".url = \"./$1/${module}\";" >> flake.nix
    echo "inputs.\"${module}\".inputs.nixpkgs.follows = \"nixpkgs\";" >> flake.nix

  done

}

modularize general
modularize programs

echo "}" >> flake.nix


## Unset variables

unset MESSAGE
unset NIXOS_VERSION

