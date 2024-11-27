#!/usr/bin/env sh

set -euo pipefail

mkdir -p $HOME/screenshots
cd $HOME/screenshots

take() {
  grim -g "$(slurp)" "$(date +'%T.png')"
  notify-send "Done" "Screenshot is in \"$HOME/screenshots\" directory" -u low
}

view() {
  nsxiv -bt .
}

delete() {
  nsxiv -btoq . | xargs rm
}

menu() {
  echo -e "take\nview\ndelete" | dmenu -c -l 10 -noi | xargs screenshot
  exit
}

$1

