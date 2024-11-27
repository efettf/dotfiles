#!/usr/bin/env sh

set -e

cd $HOME/music

fst="$1"; shift

for name in "$@"; do
  yt-dlp "ytsearch:$fst $name" -x
done

