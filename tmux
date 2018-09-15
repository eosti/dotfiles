## COLOR REFERENCE: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
######################
### DESIGN CHANGES ###
######################

# Use the xterm-256color terminal
set -g default-terminal "xterm-256color"

# Apply Tc
set-option -ga terminal-overrides ",xterm-256color:Tc"

# The panes {

set -g pane-border-bg colour235
set -g pane-border-fg colour238
set -g pane-active-border-bg colour236
set -g pane-active-border-fg colour51

***REMOVED***
# The statusbar {

set -g status-left-length 150
set -g status-right-length 150
set -g status-justify "right"
set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137
set -g status-attr dim

set -g status-left "#(~/.config/tmux-powerline/powerline.sh left)"
set -g status-right  "#(~/.config/tmux-powerline/powerline.sh right)"

setw -g window-status-format '#[fg=colour235,bg=colour234]#[fg=colour245,bg=colour235] #I  #W  #F #[fg=colour234,bg=colour235]#[fg=colour234,colour234]'
setw -g window-status-current-format '#[fg=colour237,bg=colour234]#[fg=colour1,bg=colour237] #I  #W  #F #[fg=colour234,bg=colour237]#[fg=colour234,bg=colour234]' 

#setw -g window-status-format '#[fg=colour234,bg=colour235]#[fg=colour245,bg=colour235] #I  #W  #F #[fg=colour235,bg=colour234] '
#setw -g window-status-current-format '#[fg=colour234,bg=colour237]#[fg=colour174,bg=colour237] #I  #W  #F #[fg=colour237,bg=colour234] ' 
***REMOVED***
# The messages {

set -g message-attr bold
set -g message-fg colour0
set -g message-bg colour202

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1
***REMOVED***

#############
#   OTHER   #
#############
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# split panes using | and -
bind \ split-window -h
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
set -sg escape-time 0

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

set -g @continuum-restore 'on'

set-option -g default-shell /bin/zsh

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

