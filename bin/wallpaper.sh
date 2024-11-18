#!/bin/sh

cd $HOME/wallpapers

ls -I "*.md" -I "*.sh" | fzf | xargs swww img

