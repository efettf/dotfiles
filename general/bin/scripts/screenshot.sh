
set -euo pipefail

mkdir -p $HOME/screenshots
cd $HOME/screenshots

option=$(echo -e "take\nview\ndelete" | dmenu -c -l 10 -vi -noi)

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

$option

