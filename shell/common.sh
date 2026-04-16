# shell/common.sh — shared environment, aliases, functions

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

source "$DOTFILES_DIR/shell/functions.sh"
