# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:~/bin:$PATH

# Load .aliases
test -f $DOTFILES/.aliases && source DOTFILES/.aliases

# add python3 to path
export PATH=$HOME/Library/Python/3.7/bin:$PATH
