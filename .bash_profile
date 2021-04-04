if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=$HOME/.homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/.homebrew/caches
eval "$(anyenv init -)"
