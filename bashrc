
#                                                  
export VISUAL=vim
export EDITOR=vim

export PATH
export GOPATH=/Users/reid/go/
export PATH=$GOPATH/bin:$PATH
PATH=$PATH:$HOME/bin
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

#Fuck Config
eval "$(thefuck --alias)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\w @ \h(\u): "

source "`brew --prefix grc`/etc/grc.bashrc"

alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

