# .bashrc - portable loader.
# Platform-specific configuration lives in fragment files that are sourced
# directly from the repo, so this file stays small and identical everywhere.

export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# .dotfiles bin
export PATH="$DOTFILES/bin:$PATH"

# Platform-specific config FIRST: it sets up PATH (Homebrew on macOS,
# ~/.local/bin on Linux) and tool managers, so the shared integrations in
# .bashrc.common (starship prompt, kubectl completion) can find those tools.
case "$(uname -s)" in
  Darwin) [ -f "$DOTFILES/bash/.bashrc.darwin" ] && source "$DOTFILES/bash/.bashrc.darwin" ;;
  Linux)  [ -f "$DOTFILES/bash/.bashrc.linux" ]  && source "$DOTFILES/bash/.bashrc.linux" ;;
esac

# Shared config + interactive integrations (run after PATH is established)
[ -f "$DOTFILES/bash/.bashrc.common" ] && source "$DOTFILES/bash/.bashrc.common"
