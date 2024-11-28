#!/usr/bin/env sh

set -euo pipefail

nixos-generate-config --show-hardware-config \
  | sed -e '2,3d' \
  | sed -e ' 1 s/.*/&./' \
  | sed -e '1 a\# See flake.nix instead or read README.' \
  > "$1.nix"


