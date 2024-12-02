
set EDITOR 'nvim'

abbr j 'just'
abbr v 'nvim'
abbr n 'git'
abbr g 'git'
abbr l 'eza'

alias zrm 'zoxide remove $(pwd)'

fish_vi_key_bindings

set fish_greeting ''

function fish_prompt
  echo -e "$(basename $PWD)@$(hostname) \033[0;32m> "; 
end

function transient_prompt_func
  echo -e '\033[0;32m> '
end

function fish_mode_prompt; end

set fish_cursor_default 'underscore'
set fish_cursor_insert  'underscore'
set fish_cursor_visual  'underscore'

zoxide init fish | source

