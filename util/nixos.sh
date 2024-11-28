#!/usr/bin/env sh

set -euo pipefail

[ ! -e "../hosts/$(hostname).nix" ] && just hosts generate $(hostname)

[ -d "/nix/store/" ] && nixos-rebuild switch --flake . --use-remote-sudo

