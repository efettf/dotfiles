
set -as terminal-features ',*:clipboard'
set -s copy-command 'wl-copy'

# Disable statusbar.
set -g status off

# Enable mouse support.
set -g mouse on

# Enable true color.
set -g default-terminal "$TERM"
set -ag terminal-overrides ",$TERM:Tc"

# Alt + d prefix.
set -g prefix M-d

# Disable pane switching after escape.
set -s escape-time 0

# Count panes & windows indexes from 1.
set -g pane-base-index 1
set -g base-index 1

setw -g mode-keys vi

bind -T copy-mode-vi v   send -X begin-selection
bind -T copy-mode-vi C-v send -X rectangle-toggle

# Alt + number window switching.
bind -n M-1 selectw -t :1
bind -n M-2 selectw -t :2
bind -n M-3 selectw -t :3
bind -n M-4 selectw -t :4

name="ps -o state= -o comm= -t '#{pane_tty}' | rg -Po '(?<=.{2})(.*)$' | tail -n1"
panes="tmux list-panes | wc -l"

bind -n M-v splitw -c "#{pane_current_path}" -h
bind -n M-s splitw -c "#{pane_current_path}"
bind -n M-c neww

bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

bind -n M-f if "[ $(eval $name) = 'gitu' ]" killp {
  splitw -c '#{pane_current_path}' 'gitu'
  resizep -y 35%
}

bind -n M-q if "[ $(eval $panes) = '1' ]" {
  if "[ $(eval $name) = 'gitu' ]" "send-keys q" ""
  if "[ $(eval $name) = 'nvim' ]" "send-keys Z" ""
} killp

bind s source "$HOME/.config/tmux/tmux.conf"

# Resize panes with vim movement keys.
bind -r j resizep -D 2
bind -r k resizep -U 2
bind -r h resizep -L 4
bind -r l resizep -R 4

