######################
### DESIGN CHANGES ###
######################

set -g default-terminal "xterm-256color"

# Source statusbar from Tmuxline
# Config found in .vimrc, generate with :Tmuxline and :TmuxlineSnapshot
if-shell "test -f ~/.tmuxline" "source ~/.tmuxline"
set -g status-justify left

#############
#   OTHER   #
#############
# split panes using | and -
bind \\ split-window -h
bind - split-window -v
unbind '"'
unbind %

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# amount of time for which status line messages and other indicators
# are displayed. time is in milliseconds.
set -g display-time 1000

# Disable mouse mode (tmux 2.1 and above)
set -g mouse on

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf  \; display-message "tmux.conf reloaded."

# Start window numbering at 1
set -g base-index 1

# start pane numbering at 1
set -g pane-base-index 1

# don't freak out when windows are closed
set -g renumber-windows on

# don't rename windows automatically
set-option -g allow-rename off

# Makes stuff faster?
set -sg escape-time 5

# Required for vim-gitgutter
set -g focus-events on

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

set -g @continuum-restore 'on'

set-option -g default-shell /bin/zsh

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

