#!/usr/bin/env bash
# Apply these dotfiles inside a Linux environment, e.g. a Cursor / VS Code
# devcontainer. Installs a personal shell prompt plus a few optional CLI tools,
# then stows the dotfiles.
#
# This is intentionally NOT the macOS bootstrap. It never runs install.sh,
# .macos, Homebrew, NVM, or pyenv. Node + pnpm are expected to come from the
# devcontainer (Node feature + Corepack).
#
# Idempotent: every install is guarded so re-running is safe.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

log() { echo "==> $*"; }

# --- apt helper (only does anything when apt-get is available) ---------------
APT_UPDATED=0
SUDO=""
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  SUDO="sudo"
fi

apt_install() {
  command -v apt-get >/dev/null 2>&1 || return 0
  if [ "$APT_UPDATED" -eq 0 ]; then
    log "Updating apt package lists"
    $SUDO apt-get update -y
    APT_UPDATED=1
  fi
  $SUDO apt-get install -y "$@"
}

# --- 1. Core dependencies: git + GNU Stow ------------------------------------
command -v git >/dev/null 2>&1 || apt_install git
if ! command -v stow >/dev/null 2>&1; then
  log "Installing GNU Stow"
  apt_install stow
fi

# --- 2. Starship prompt (required by the dotfiles prompt) --------------------
if ! command -v starship >/dev/null 2>&1; then
  log "Installing starship"
  curl -fsSL https://starship.rs/install.sh | sh -s -- --yes
fi

# --- 3. Optional CLI tools (comment out anything you do not want) ------------
log "Installing optional CLI tools (ripgrep, fzf, bat)"
apt_install ripgrep fzf bat || true

# zoxide (smarter cd); the install script keeps it current across distros
if ! command -v zoxide >/dev/null 2>&1; then
  log "Installing zoxide"
  curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh || true
fi

# --- 4. Stow the dotfiles ----------------------------------------------------
log "Stowing dotfiles"
"$DOTFILES/scripts/stow-dotfiles.sh"

# --- 5. Seed ~/.gitconfig.local if missing -----------------------------------
if [ ! -f "$HOME/.gitconfig.local" ] && [ -f "$DOTFILES/gitconfig.local.example" ]; then
  cp "$DOTFILES/gitconfig.local.example" "$HOME/.gitconfig.local"
  log "Created ~/.gitconfig.local - edit it with your name, email, and (optional) signing key."
fi

log "Done. Start a new bash shell (or run 'source ~/.bashrc') to load your dotfiles."
