#!/bin/bash
# some useful alias to speed up everyday work.

## about apt shortcut ##
alias apt-fd=`sudo apt-cache apt-search`
alias apt-in=`sudo apt-get install`
alias apt-purge=`sudo apt-get purge`
alias apt-rm=`sudo apt-get remove`
alias apt-up=`sudo apt-get upgrade`

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias mkdir='mkdir -pv'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'

# share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history
alias h='history'
alias hg="history | grep"

## alias ports='netstat -tulanp' ##

# make executable
alias ax="chmod a+x"

# copy output of last command to clipboard
alias cl="fc -e -|pbcopy"
# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'
# find files in our current directory e
alias fhere="find . -name "

## system alias
# list our disk usage in human-readable units including filesystem type, 
# and print a total at the bottom
alias df="df -Tha --total"
alias du="du -ach | sort -h"

# ake our process table searchable that searches our process for an argument we'll pass
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# look up your public IP address
alias myip="curl http://ipecho.net/plain; echo"

# can not know what it works,but output some columns we want.
# history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

# Author: https://github.com/xvoland/Extract
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# beep - why or why do you want to make noise ? just fun :)
alias beep='echo -en "\007"'

# Delete temporary files in current directory
alias sweep='find . -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete'

# Find text in any file
ft() { 
find . -name "$2" -exec grep -il "$1" {} \;
}
# find in files
fg () {
find . -name "${2:-*}" | xargs grep -il "$1";
}

# add alias with comment.
function adal {
desc="ADD DESCRIPTION..."
if [ -n "$3" ]; then
desc="$3"
fi  
echo "" >> ~/.bash_aliases
echo "###" >> ~/.bash_aliases
echo "##
 
$desc" >> ~/.bash_aliases
echo "#" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "alias '$1'='$2'" >> ~/.bash_aliases
source ~/.bash_aliases
echo "" && echo "- Alias added -" && echo ""
}

alias goup=`sudo proxy.sh up`
alias goff=`sudo proxy.sh off`