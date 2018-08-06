#  ---------------------------------------------------------------------------
#
#  This file is referenced by bash_profile, so all changes should be made here.
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
	black=$(tput setaf 0)	#ANSI 30m
	red=$(tput setaf 1)		#ANSI 31m
	green=$(tput setaf 2)	#ANSI 32m
   	yellow=$(tput setaf 3)	#ANSI 33m
   	blue=$(tput setaf 4)	#ANSI 34m
   	magenta=$(tput setaf 5)	#ANSI 35m
   	cyan=$(tput setaf 6)	#ANSI 36m
   	white=$(tput setaf 7)	#ANSI 37m
   	reset=$(tput sgr0)		#ANSI 0m
	veryred=$(tput bold && tput setaf 2)

	export PS1="\[$red\][\[$blue\]\u\[$red\]@\[$cyan\]\h\[$red\]:\[$green\]\w\[$yellow\]\$git_branch\[$red\]] \[$red\]$ \[$reset\]"
    export PS2="| => "

    export SUDO_PS1="\[$veryred\]{\u@\h:\w} # \[$reset\]"

#PS1 Git Implementation
#	------------------------------------------------------------
	export GITAWAREPROMPT=~/.bash/git-aware-prompt
	source "${GITAWAREPROMPT}/prompt.sh"

#  Set Paths
#   ------------------------------------------------------------
	export ANDROID_HOME=/Users/$USER/Library/Android/sdk
    export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin
    export PATH=$PATH:/Users/$USER/go/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

	test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
   export CLICOLOR=1
   export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#  export LSCOLORS=ExFxBxDxCxegedabagacad


#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
#cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias sudo='sudo '							# Workaround for 'sudo [alias]'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias spoof='spoof-mac.py'					# Shortcut for spoof-mac
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

alias pipes.sh='pipes.sh -p 5 -t 3 -R'	    #Pipes.sh config
alias clock='tty-clock -cstrx -C 6'	   		#TTY-Clock config
alias damnit='sudo !!'
alias fucking='sudo'
alias t='todolist'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   thefuck: Autocorrect common mistypes
#   --------------------------------------
    eval "$(thefuck --alias)"

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

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


#   ---------------------------
#   4. SEARCHING
#   ---------------------------

#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------

export PATH="/usr/local/sbin:$PATH"

git_branch() {
	  git branch 2>/dev/null | grep '^*' | colrm 1 2
  }
