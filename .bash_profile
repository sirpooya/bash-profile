export PS1="㋡\[\033[34;1m\]\w> \[\e[0m\]"

play() { spotify play $@ ; }
s() { spotify $@ ; }

alias cisc='/opt/cisco/anyconnect/bin/vpn connect s7250.uiadd.site -s <~/.credentials'
alias cisd='/opt/cisco/anyconnect/bin/vpn disconnect'

own() { for item in "$@" ; do sudo chown root "$item" ; sudo chmod 777 "$item" ; echo $(tput setaf 5)"👍 Owned: $item"$(tput sgr0) ; done; echo "😉";}

run() { for item in "$@" ; do $item ; done; }

alias emu='/Users/pooya/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_28 -netdelay none -netspeed full'

alias clean='. ~/.bash_profile ; cd ~ ; clear ; echo -e "\( ^◡^)/\n\n\n"'

alias direct='open http://localhost:8080 ; cd ~/git/direct ; dev_appserver.py .'


# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pooya/google-cloud-sdk/path.bash.inc' ]; then . '/Users/pooya/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pooya/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/pooya/google-cloud-sdk/completion.bash.inc'; fi
