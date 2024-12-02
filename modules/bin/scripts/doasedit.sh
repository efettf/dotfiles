
set -eu

temp=$(mktemp)

cat "$1" > $temp

$EDITOR $temp

doas cp -f $temp "$1"

rm $temp


