
set EDITOR 'nvim'

abbr n 'git'
abbr g 'git'

alias zrm 'zoxide remove $(pwd)'
alias v   'eval "$EDITOR"'
alias l   'eza'

fish_vi_cursor
fish_vi_key_bindings

set fish_greeting ''

set fish_cursor_default 'underscore'
set fish_cursor_insert  'underscore'
set fish_cursor_visual  'underscore'

zoxide init fish | source

