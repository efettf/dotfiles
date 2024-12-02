#!/usr/bin/env sh

set -uo pipefail

for module in $(git diff --name-only | grep "modules/*" | cut -d/ -f2 | uniq); do

  nix flake update $module

done

