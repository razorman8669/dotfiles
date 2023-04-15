#!/bin/sh

echo "Setting up your Mac..."
sudo -v

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install a modern version of Bash.
brew install bash
brew install bash-completion@2
brew install docker-completion

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install --cask iterm2

# pyenv installation
brew install openssl readline sqlite3 xz zlib
brew install pyenv
brew install pyenv-virtualenv

# Remove outdated versions from the cellar.
brew cleanup

# Removes .bash* from $HOME (if it exists) and symlinks the them from the .dotfiles
rm -rf $HOME/.aliases $HOME/.bashrc $HOME/.bash_profile $HOME/.bash_prompt $HOME/.gitconfig $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/.dotfiles/.bash_prompt $HOME/.bash_prompt
ln -s $HOME/.dotfiles/.aliases $HOME/.aliases

ln -s $HOME/.dotfiles/.gitconfig ~/.gitconfig
ln -s $HOME/.dotfiles/.gitignore_global ~/.gitignore_global

# NVM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Setup awesomeVim https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
