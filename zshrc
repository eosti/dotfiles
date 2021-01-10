# zsh setup
export ZSH="/Users/reid/.oh-my-zsh"

# Update without prompting
DISABLE_UPDATE_PROMPT=true

# Theme settings
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history)
POWERLEVEL9K_MODE='nerdfont-complete'

DEFAULT_USER='reid'

# Plugins
plugins=(
  git
)

# Sources
source $ZSH/oh-my-zsh.sh
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt/llvm/bin/
export PATH=$PATH:/Users/$USER/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=/usr/local/opt/ruby/bin:$PATH
source ~/.iterm2_shell_integration.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export LD_PRELOAD="/usr/local/lib/libmsp430.so"

. /usr/local/etc/profile.d/z.sh

# Global variables
export EDITOR=/usr/local/bin/nvim
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
alias dotfiles='cd ~/Projects/dotfiles/'	# Jump to dotfiles config

# Neovim > vim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

