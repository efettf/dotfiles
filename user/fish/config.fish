
set EDITOR 'nvim'

abbr n 'git'
abbr g 'git'

alias zrm 'zoxide remove $(pwd)'
alias v   'nvim'
alias l   'eza'

fish_vi_key_bindings

set fish_greeting ''

function fish_prompt
  echo -e "$(basename $PWD) \033[0;32m❯ "; 
end

function fish_mode_prompt; end

set fish_cursor_default 'underscore'
set fish_cursor_insert  'underscore'
set fish_cursor_visual  'underscore'

