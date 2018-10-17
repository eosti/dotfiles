# zsh setup
export ZSH="/Users/reid/.oh-my-zsh"

# Theme settings
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history)

DEFAULT_USER='reid'

# Plugins
plugins=(
  git
)

# Sources
source $ZSH/oh-my-zsh.sh
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin
export PATH=$PATH:/Users/$USER/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
source ~/.iterm2_shell_integration.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/local/etc/profile.d/z.sh

# Global variables
export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k

# Configure thefuck
eval "$(thefuck --alias)"

# Aliases
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias sudo='sudo '							# Workaround for 'sudo [alias]'
alias c='cd && clear'                       # c: clear display and go home
alias pipes.sh='pipes.sh -p 5 -t 3 -R'	    # Pipes.sh config
alias clock='tty-clock -cstrx -C 6'	   		# TTY-Clock config
alias please='sudo $(fc -ln -1)'			# Re-run last command with sudo
alias t='todolist'							# todolist shortcuts
alias tl='todolist list by project'			# List all todos by project
alias ta='todolist add'						# Add a todo
alias tc='todolist complete'				# Complete a todo
alias td='todolist ac'						# Delete todos
alias dotfiles='cd ~/Projects/dotfiles/'	# Jump to dotfiles config
