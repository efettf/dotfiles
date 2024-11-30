mod hosts

default:
  @./util/rebuild.sh

alias u := update

update target:
  nix flake update {{target}}
  @just

alias r := rollback

rollback:
  nixos-rebuild switch --flake . --use-remote-sudo --rollback

alias c := clean

clean:
  nix-collect-garbage -d
  doas nix-collect-garbage -d

alias l := list

list:
  @doas nix-env --list-generations --profile /nix/var/nix/profiles/system

