#!/usr/bin/env sh

set -eu

cd $HOME/dotfiles/secrets

name=$(sops -d secrets.yaml | sed -n 'p;n' | sed -e 's/: |//g' | dmenu -c -l 10)

line=$(sops -d secrets.yaml | grep -n "$name" | head -n 1 | cut -d: -f1)

sops -d secrets.yaml | sed -n "$(expr $line + 1)p" | sed -e 's/^[ \t]*//' | wl-copy

notify-send "Done" "Password copied to user clipboard" -u low

