# shell/mac.sh — macOS platform config

alias ls='ls -G'

export PATH="/usr/local/opt/openssl@3/bin:$PATH"

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -n "$ZSH_VERSION" && -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
  autoload -Uz compinit && compinit
fi

[[ -s "$HOME/.config/envman/load.sh" ]] && source "$HOME/.config/envman/load.sh"
