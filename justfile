
default:
  just rebuild

alias u := update

update target:
  nix flake update {{target}}

stage-nix:
  git add *.nix

alias r := rebuild

rebuild:
  just stage-nix
  nixos-rebuild switch --flake . --use-remote-sudo

alias gc := clean
alias c  := clean

clean:
  nix-collect-garbage -d
  doas nix-collect-garbage -d

alias ls := list
alias l  := list

list:
  doas nix-env --list-generations --profile /nix/var/nix/profiles/system

