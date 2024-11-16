
set EDITOR nvim
set fish_greeting

abbr n 'git'
abbr g 'git'

alias zrm 'zoxide remove $(pwd)'
alias v   'eval "$EDITOR"'
alias l   'eza'

zoxide init fish | source

