export PS1="👻 \[\033[34;1m\]\w> \[\e[0m\]"
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#PS1="🇮🇷  \[\033[33;1m\]\w\[\033[m\] 👉 "
#PS1="\u@\h 🍀 \w(\W) "
##export PS1="\[\033[04;30m\]\w\[\033[m\]@\[\033[01;35m\]\u\[\033[m\]\$(parse_git_branch)\[\033[m\] 🖖  \$ $command_style"
#🇮🇷▲♣︎👻💩💀☠️👽🎃🧔🏽👱🏻‍♂🙈🐵🐣🐌☘️🍀🦔🌸🍄✨⭐️🌈🔥⏰🎉🎁📮📌🔈🔇😉👍✌️👌👋🙏😎🤬😡😤😫😩😭😢😱😳🤔🙃😂😨😰😥🤯😑😬😲😧😦🙄😪🤐😵😈👿👻💩😾👊🖕🙈

export CLICOLORS=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFh'

#alias cisc="/opt/cisco/anyconnect/bin/vpn connect us7.cisadd2.com -s <~/.credentials"
#alias cisd="/opt/cisco/anyconnect/bin/vpn disconnect"

alias cisc='/opt/cisco/anyconnect/bin/vpn connect us7.cisadd2.com -s <~/.credentials'
alias cisd='/opt/cisco/anyconnect/bin/vpn disconnect'

# =============== B00KMARKS ==================
alias apps='cd /Applications'
alias home='cd'
alias up='cd ..'
alias services='cd ~/Library/Services'
alias plugins='cd ~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins'
alias downs='cd ~/Downloads'
alias sites='cd ~/Sites'
alias dropbox='cd ~/Dropbox'

alias rr='. ~/.bash_profile'

play() { spotify play $@ ; }

alias nnprofile='nano ~/.bash_profile'
alias nnhosts='nano /etc/hosts'
alias nnhttpd='nano /etc/apache2/httpd.conf'
alias nnphp='nano /etc/php.ini'
alias nnvhosts='nano /etc/apache2/extra/httpd-vhosts.conf'

alias poweroff='sudo /sbin/shutdown -h now'


search() { find . -name "*$1*" ; }
own() { for item in "$@" ; do sudo chown root "$item" ; sudo chmod 777 "$item" ; echo $(tput setaf 5)"👍 Owned: $item"$(tput sgr0) ; done; echo "😉";}
mkalias() { source=`pwd`"/$1" ; destination="/Users/sirrichard/Downloads" ;  script=$(osascript -e 'tell application "Finder" to make alias file to POSIX file "'$source'" at POSIX file "'$destination'"' -e 'return 1' ); if [ $script = 1 ] ; then echo "Alias \"$1\" Created at \"$destination\""; fi; }


volup() { osascript -e "set volume $1" ; }
voldown() { osascript -e "set volume 0" ; } 
  
vol() {
    vol=`osascript -e 'get output volume of (get volume settings)'`;
    newvol=$vol;
    echo "------ $vol --> $newvol";
    if [[ $1 = "" || $1 = "show" ]]; then
        cecho "🔈 Current volume level is $vol.";
    elif [ "$1" = "up" ]; then
        if [ $vol -le 90 ]; then
            newvol=$(( vol+10 ));
            cecho "🔈 Increasing volume to $newvol.";
        else
            newvol=100;
            cecho "🔈 volume level is at max.";
        fi
    elif [ "$1" = "down" ]; then
        if [ $vol -ge 10 ]; then
            newvol=$(( vol-10 ));
            cecho "🔈 Reducing volume to $newvol.";
        else
            newvol=0;
            cecho "🔇 volume level is at min.";
        fi
    elif [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -ge 0 && $1 -le 100 ]]; then
        newvol=$1;
        cecho "🔈 Setting volume level to $newvol";
    else
        echo "Improper use of 'vol' command"
        echo "The 'vol' command should be used as follows:"
        echo "  vol up                       # Increases the volume by 10%.";
        echo "  vol down                     # Decreases the volume by 10%.";
        echo "  vol [amount]                 # Sets the volume to an amount between 0 and 100.";
        echo "  vol                          # Shows the current volume.";
    fi
    cecho "$newvol";
    osascript -e "set volume $(( newvol/10 ))";
}


togglewifi() {
    set_wifi_on_or_off() {
    networksetup -getairportpower en${n} | grep ": ${1}";
    if test $? -eq 0;
    then
        echo WiFi interface found: en${n};
        eval "networksetup -setairportpower en${n} ${2}"
        return 0;
    fi
    return 1;
    }

    for n in $(seq 0 10);
    do
    if set_wifi_on_or_off "On" "off"; then break; fi;
    if set_wifi_on_or_off "Off" "on"; then break; fi;
    done
}

#clear;

source ~/sites/goto-bash/goto.sh
source ~/bin/bashmarks.sh
source /etc/bash.command-not-found
