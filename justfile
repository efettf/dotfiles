mod hosts

default:
  ./util/flake/generate.sh
  ./util/flake/update-diff.sh
  ./util/rebuild.sh
  rm flake.nix

alias u := update

update target:
  ./util/flake/generate.sh
  nix flake update {{target}}
  ./util/rebuild.sh
  rm flake.nix

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

