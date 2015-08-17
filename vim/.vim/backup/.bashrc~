# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# /etc/bashrc

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
    xterm*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        fi
        ;;
    screen)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        fi
        ;;
    *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
    # You might want to have e.g. tty in prompt (e.g. more virtual machines)
    # and console windows
    # If you want to do so, just add e.g.
    # if [ "$PS1" ]; then
    #   PS1="[\u@\h:\l \W]\\$ "
    # fi
    # to your custom modification shell script in /etc/profile.d/ directory
fi

if ! shopt -q login_shell ; then # We're not a login shell
    # Need to redefine pathmunge, it get's undefined at the end of /etc/profile
    pathmunge () {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                if [ "$2" = "after" ] ; then
                    PATH=$PATH:$1
                else
                    PATH=$1:$PATH
                fi
        esac
    }

    # By default, we want umask to get set. This sets it for non-login shell.
    # Current threshold for system reserved uid/gids is 200
    # You could check uidgid reservation validity in
    # /usr/share/doc/setup-*/uidgid file
    if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
       umask 002
    else
       umask 022
    fi

    # Only display echos from profile.d scripts if we are no login shell
    # and interactive - otherwise just process them to set envvars
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                . "$i"
            else
                . "$i" >/dev/null 2>&1
            fi
        fi
    done

    unset i
    unset pathmunge
fi

##########################################################################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Append to history file rather that overwrite
shopt -s histappend

HISTIGNORE='ls:bg:fg:history'

# Adjust bash history size
HISTFILESIZE=1000000
HISTSIZE=1000000

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%h/%d - %H:%M:%S "

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
        eval "`dircolors -b /etc/dircolorsrc`"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

### To update fonts: fc-cache --force

### For lftp via TLS
### lftp
### set ftp:ssl-allow true
### set ftp:ssl-force true
### set ftp:ssl-protect-data true
### set ftp:ssl-protect-list true
### connect <server address>
### login <username>
### mirror <directory>

alias ubuntu='ssh ubuntu'
alias office='ssh office'
alias skynet='ssh skynet'
alias cyberdyne='ssh cyberdyne'

alias afs_office='sshfs -o idmap=user srsantos@131.204.120.166: /home/srsantos/Cache/SSH_mounts/office -C -p 10022'
alias afs_ubuntu='sshfs -o idmap=user srsantos@131.204.120.103: /home/srsantos/Cache/SSH_mounts/ubuntu -C -p 22'

alias l='ls -Fhl'
alias ll='ls -Fahl'
alias desktop='cd ~/Desktop'
alias rm='rm -i'
alias bye='exit'
alias nano='vim'
alias rm_DS_Stores='find . -name *.DS_Store -type f -exec rm {} \;'
alias only_read_permissions='chmod 644'
alias mk_executable='chmod 755'
alias unpacktarball='tar xvfz'
alias packtarball='tar -pczf'
alias bz2unpack='tar xvjf'
alias space_left='df -h | grep -v none'
alias all_connections='netstat -tulpn'
alias vnc_via_ssh='ssh -p 10022 -L 5901:office:5900 srsantos@office'
alias su='su -'
alias feh_viewer='feh -q -g 640x480 -d -S filename .'
alias firefox='/usr/local/bin/mozilla_firefox'

# Pacman aliases
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

### General variables ####
export PAGER='vimpager'
export LESS='eMq'
export EDITOR='vim'
export LANG='en_US.UTF-8'

#### USEFUL TIDBITS ####
## awk '{for(i=1;i<=NF;i++)if(arr[i] ~ /./)arr[i]=arr[i]"\n"$i;else arr[i]=$i}END{for(x=1;x<=length(arr);x++)printf("%s\n",arr[x])}'
## to remove empty FASTA entries: awk '$2{print RS $0}' FS='\n' RS=\> ORS=

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################

bash_prompt_command() {
            # How many characters of the $PWD should be kept
            local pwdmaxlen=25
            # Indicate that there has been dir truncation
            local trunc_symbol=".."
            local dir=${PWD##*/}
            pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
            NEW_PWD=${PWD/$HOME/~}
            local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
            if [ ${pwdoffset} -gt "0" ]
                then
                NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
                NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
            fi
}
#
bash_prompt() {
    local NONE='\[\033[0m\]'    # unsets color to term's fg color

        # regular colors
        local K='\[\033[0;30m\]'    # black
        local R='\[\033[0;31m\]'    # red
        local G='\[\033[0;32m\]'    # green
        local Y='\[\033[0;33m\]'    # yellow
        local B='\[\033[0;34m\]'    # blue
        local M='\[\033[0;35m\]'    # magenta
        local C='\[\033[0;36m\]'    # cyan
        local W='\[\033[0;37m\]'    # white

        # empahsized (bolded) colors
        local EMK='\[\033[1;30m\]'
        local EMR='\[\033[1;31m\]'
        local EMG='\[\033[1;32m\]'
        local EMY='\[\033[1;33m\]'
        local EMB='\[\033[1;34m\]'
        local EMM='\[\033[1;35m\]'
        local EMC='\[\033[1;36m\]'
        local EMW='\[\033[1;37m\]'

        # background colors
        local BGK='\[\033[40m\]'
        local BGR='\[\033[41m\]'
        local BGG='\[\033[42m\]'
        local BGY='\[\033[43m\]'
        local BGB='\[\033[44m\]'
        local BGM='\[\033[45m\]'
        local BGC='\[\033[46m\]'
        local BGW='\[\033[47m\]'

        local UC=$C                 # user's color
        [ $UID -eq "0" ] && UC=$R   # root's color

        PS1="${W}[\t${W}] ${G}[${Y}\u${Y}@${Y}\h ${EMB}\${NEW_PWD}${G}]${W}\\$ ${NONE}"
}
#
PROMPT_COMMAND=bash_prompt_command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
bash_prompt
unset bash_prompt

# the below is for when working in tmux
settitle() {
    printf "\033k$1\033\\"
}

ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "bash"
}

# set the title in various terms to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

