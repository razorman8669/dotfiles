# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Load .bashrc .bash_prompt if exists
test -f ~/.bashrc && source ~/.bashrc
test -f ~/.bash_prompt && source ~/.bash_prompt

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
