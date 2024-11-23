#!/bin/sh

getopts rc flag
set -e

[ "$flag" = "r" ] && rm ".git" -rf
[ "$flag" = "c" ] || gh repo create $(basename "$PWD") --public

git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/efettf/$(basename "$PWD")
git push -u origin main

