# Rays Dotfiles

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually.

## A Fresh macOS Setup

These instructions are for when you've already set up your dotfiles. If you want to get started with your own dotfiles you can [find instructions below](#your-own-dotfiles).

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Save ssh keys
- Save Keychain
-

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS.

### Setting up your Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles` `git clone git@github.com:razorman8669/dotfiles.git ~/.dotfiles`
7. Run `./install.sh` to start the installation
9. Restart your computer to finalize the process
10. setup firewall and disk encryption: http://sourabhbajaj.com/mac-setup/Security/
11. install gcloud: https://cloud.google.com/sdk/docs/quickstart

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the [`.bashrc`](./.bashrc) file.

## Your Own Dotfiles

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

Check out the [`aliases`](./.aliases) file and add your own aliases.

Copy [`gitconfig.local.example`](./gitconfig.local.example) to `~/.gitconfig.local` and set your Git name, email, and GPG signing key. That file stays on your machine and is not committed (see [`.gitignore`](./.gitignore)).

## Hosts

A malware and adware removing hosts file from https://github.com/StevenBlack/hosts/blob/master/readme.md#option-1-use-our-container-image-linux-only
Use `docker run --pull always --rm -it -v /etc/hosts:/etc/hosts -v ~/.dotfiles/myhosts ghcr.io/stevenblack/hosts:latest updateHostsFile.py --auto --replace` to update the host file to the latest.


## Thanks To...

[Github does dotfiles](https://dotfiles.github.io/) project. Both [Zach Holman](https://github.com/holman/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) were great sources of inspiration. [Sourabh Bajaj](https://twitter.com/sb2nov/)'s [Mac OS X Setup Guide](http://sourabhbajaj.com/mac-setup/) proved to be invaluable. lastly, I'd like to thank [Maxime Fabre](https://twitter.com/anahkiasen) for [his excellent presentation on Homebrew](https://speakerdeck.com/anahkiasen/a-storm-homebrewin) which made me migrate a lot to a [`Brewfile`](./Brewfile)
