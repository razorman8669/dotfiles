# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:~/bin:$PATH

# add python3 executables to path
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# brew install bash-completion
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# Load .aliases
test -f $DOTFILES/.aliases && source $DOTFILES/.aliases

# Search up/down
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
