
default:
  just rebuild

alias u := update

update target:
  nix flake update {{target}}

rebuild:
  nixos-rebuild switch --flake . --use-remote-sudo

alias r := rollback

rollback:
  nixos-rebuild switch --flake . --use-remote-sudo --rollback

alias gc := clean
alias c  := clean

clean:
  nix-collect-garbage -d
  doas nix-collect-garbage -d

alias ls := list
alias l  := list

list:
  doas nix-env --list-generations --profile /nix/var/nix/profiles/system

