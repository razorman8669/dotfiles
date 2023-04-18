# Path to your dotfiles installation.
export DOTFILES="$HOME/.dotfiles"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Apple Silicon location
export PATH=/opt/homebrew/bin:$PATH
# Homebrew sbin
export PATH=/opt/homebrew/sbin:$PATH

# user home binaries
export PATH=$HOME/bin:$PATH

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Chromium - make sure to `git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git`
# From https://chromium.googlesource.com/chromium/src/+/HEAD/docs/mac_build_instructions.md
export PATH="$PATH:$HOME/dev/depot_tools"

# DOCKER
# use plain buildkit output
export BUILDKIT_PROGRESS=plain

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

eval "$(pyenv init -)"

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# Load .aliases
test -f $DOTFILES/.aliases && source $DOTFILES/.aliases

# Search up/down (reverse lookup on arrow keys)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bash-completion2
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Make vim the default editor.
export EDITOR='vim';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTTIMEFORMAT="%F %T "
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# OpenSSL homebrew: https://github.com/pyenv/pyenv/wiki/Common-build-problems#error-the-python-ssl-extension-was-not-compiled-missing-the-openssl-lib
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
