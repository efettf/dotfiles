
default:
  just hosts list

alias l := list

list:
  @ls *.nix -1

alias c := count

count:
  @ls *.nix -1 | wc -l

alias g := generate

generate name:
  nixos-generate-config --show-hardware-config > {{name}}.nix

