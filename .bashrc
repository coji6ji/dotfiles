[[ -s "$HOME/.projectrc" ]] && source "$HOME/.projectrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.localrc" ]] && source "$HOME/.localrc"

alias ll='ls -la'
alias cdu='cd ../'
alias device="idevice_id -l"
alias device_log="idevicesyslog -u "

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config
source ~/.bash/git-completion.sh

export PATH=$PATH:/Users/araihara-k/bin
export PATH=/usr/local:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/Cellar/python3/3.4.3_2/bin:$PATH
export PATH=/Users/araihara-k/Library/Android/sdk/platform-tools:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
