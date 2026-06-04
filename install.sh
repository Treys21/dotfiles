#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_TS="$(date +%Y%m%d-%H%M%S)"

safe_link() {
  local src="$1" target="$2"
  mkdir -p "$(dirname "$target")"
  if [[ -f "$target" && ! -L "$target" ]]; then
    cp "$target" "${target}.bak.${BACKUP_TS}"
    echo "Backed up $target"
  fi
  ln -sf "$src" "$target"
  echo "Linked $target"
}

safe_link "$DOTFILES_DIR/.zshrc"                       "$HOME/.zshrc"
safe_link "$DOTFILES_DIR/config/git/config"            "$HOME/.config/git/config"
safe_link "$DOTFILES_DIR/config/git/ignore"            "$HOME/.config/git/ignore"
safe_link "$DOTFILES_DIR/config/claude/CLAUDE.md"      "$HOME/.claude/CLAUDE.md"

mkdir -p "$HOME/.config"
cp "$DOTFILES_DIR/config/ohmyposh.json" "$HOME/.config/ohmyposh.json"
echo "Copied ohmyposh.json"

if ! command -v oh-my-posh &>/dev/null; then
  if command -v brew &>/dev/null; then
    echo "Installing Oh My Posh..."
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
  else
    echo "Homebrew not found — install Oh My Posh manually: https://ohmyposh.dev/docs/installation/macos"
  fi
fi

echo ""
echo "Done! Reload your shell:"
echo "  exec zsh -l"
