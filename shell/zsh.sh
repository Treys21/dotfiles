# shell/zsh.sh — zsh-specific setup

autoload -U compinit && compinit -u
autoload -U colors && colors
setopt COMPLETE_IN_WORD

export CLICOLOR=1
