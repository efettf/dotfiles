#!/usr/bin/env sh

nsxiv -btoq $HOME/wallpapers/* | head -n 1 | xargs swww img

