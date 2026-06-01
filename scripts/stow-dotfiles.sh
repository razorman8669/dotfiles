#!/usr/bin/env bash
# Symlink the dotfiles into $HOME using GNU Stow, then wire up the platform
# git config. Safe to run repeatedly (re-stows in place).
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
PACKAGES=(bash git starship)

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: GNU Stow is not installed." >&2
  echo "  macOS:         brew install stow" >&2
  echo "  Debian/Ubuntu: sudo apt-get install -y stow" >&2
  exit 1
fi

echo "==> Stowing packages: ${PACKAGES[*]}"
cd "$DOTFILES"
stow --no-folding --target="$HOME" --restow "${PACKAGES[@]}"

# Git has no native OS-conditional include, so resolve it here: point
# ~/.gitconfig.platform (included by git/.gitconfig) at the right fragment.
case "$(uname -s)" in
  Darwin) ln -sf "$DOTFILES/git/gitconfig.darwin" "$HOME/.gitconfig.platform" ;;
  Linux)  ln -sf "$DOTFILES/git/gitconfig.linux"  "$HOME/.gitconfig.platform" ;;
esac

echo "==> Dotfiles stowed."
