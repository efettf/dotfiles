
default:
  just hosts list

alias l := list

list:
  @ls *.nix -1

alias c := count

count:
  @expr $(ls *.nix -1 | wc -l) - 1

alias g := generate

generate name:
  @./generate.sh {{name}}

