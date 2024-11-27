#!/usr/bin/env sh

set -eu

cd $HOME/music

count=$(ls -1 | wc -l)

[ "$count" -gt "5" ] \
  && export flagNum="-l 10" \
  || export flagNum="-noi"

ls | dmenu -b -vi $flagNum | mpc add

