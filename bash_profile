if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

