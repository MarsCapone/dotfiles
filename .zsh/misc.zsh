# Autocompletion for 1Password
eval "$(op completion zsh)"; compdef _op op

# Autocompletion for Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
