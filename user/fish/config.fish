
# Boostrap fundle.
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'zzhaolei/transient.fish'
fundle plugin 'meaningful-ooo/sponge'

fundle init

set EDITOR 'nvim'

abbr n 'git'
abbr g 'git'

alias zrm 'zoxide remove $(pwd)'
alias v   'nvim'
alias l   'eza'

fish_vi_cursor
fish_vi_key_bindings

set fish_greeting ''

alias fish_prompt 'echo "$(basename $PWD) ❯ "'

set fish_cursor_default 'underscore'
set fish_cursor_insert  'underscore'
set fish_cursor_visual  'underscore'

zoxide init fish | source

