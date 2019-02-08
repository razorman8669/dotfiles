# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:~/bin:$PATH

# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# brew install bash-completion
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# Load .aliases
test -f $DOTFILES/.aliases && source $DOTFILES/.aliases

# Search up/down
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
