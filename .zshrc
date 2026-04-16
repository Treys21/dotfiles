DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles-personal}"

source "$DOTFILES_DIR/shell/common.sh"
source "$DOTFILES_DIR/shell/zsh.sh"
source "$DOTFILES_DIR/shell/mac.sh"

[[ -f ~/.secretenv ]] && source ~/.secretenv

if command -v oh-my-posh &>/dev/null; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh.json)"
fi
