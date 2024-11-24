#!/usr/bin/env sh
# Simplest and most buggy solution for this problem.
# There are a lot better scripts that do this but this works for me.

set -eu

temp=$(mktemp)

cat "$1" > $temp

$EDITOR $temp

doas cp -f $temp "$1"

rm $temp


