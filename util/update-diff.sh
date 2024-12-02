#!/usr/bin/env sh

set -uo pipefail

changed=$(git diff --name-only | grep "modules/*" | cut -d/ -f2 | uniq)

for module in $changed; do

  nix flake update $module

done

