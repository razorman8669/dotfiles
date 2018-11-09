#!/bin/sh

echo "Setting up your Mac..."
sudo -v

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# set brew bash shell to default (from https://merapar.com/2017/04/10/700/)
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells > /dev/null
sudo chsh -s /usr/local/bin/bash

# Removes .bash* from $HOME (if it exists) and symlinks the them from the .dotfiles
rm -rf $HOME/.aliases $HOME/.bashrc $HOME/.bash_profile $HOME/.bash_prompt $HOME/.gitconfig $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/.dotfiles/.bash_prompt $HOME/.bash_prompt
ln -s $HOME/.dotfiles/.aliases $HOME/.aliases

ln -s $HOME/.dotfiles/.gitconfig ~/.gitconfig
ln -s $HOME/.dotfiles/.gitignore_global ~/.gitignore_global

# Setup awesomeVim https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
