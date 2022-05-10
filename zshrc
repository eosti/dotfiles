# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh setup
export ZSH="/Users/reid/.oh-my-zsh"

# z fuzzy completion
  . /opt/homebrew/etc/profile.d/z.sh

# Brew with M1
export PATH="/opt/homebrew/bin:$PATH"

# Update without prompting
DISABLE_UPDATE_PROMPT=true

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Plugins
plugins=(
  git
  pyenv
)

# Sources
source $ZSH/oh-my-zsh.sh
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt/llvm/bin/
export PATH=$PATH:/Users/$USER/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=/usr/local/opt/ruby/bin:$PATH
source ~/.iterm2_shell_integration.zsh

# Global variables
export EDITOR=/usr/local/bin/nvim
export BLOCKSIZE=1k
DEFAULT_USER='reid'

# Configure thefuck
eval "$(thefuck --alias)"

# Aliases
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias sudo='sudo '                          # Workaround for 'sudo [alias]'
alias c='cd && clear'                       # c: clear display and go home
alias pipes.sh='pipes.sh -p 5 -t 3 -R'      # Pipes.sh config
alias clock='tty-clock -cstrx -C 6'         # TTY-Clock config
alias please='sudo $(fc -ln -1)'            # Re-run last command with sudo
alias dotfiles='cd ~/Projects/dotfiles/'    # Jump to dotfiles config

# Neovim > vim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export PATH="/usr/local/opt/curl/bin:$PATH"

# brew ZSH packages
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
