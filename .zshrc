# Load Starship (https://starship.rs)
source <(/opt/homebrew/bin/starship init zsh --print-full-init)

# Don't insert a tab character if nothing has been typed
zstyle ':completion:*' insert-tab false

# Path edits
export PATH="$HOME/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/Library/ApplicationSupport/JetBrains/Toolbox/scripts:$PATH"

# Essential environment
eval $(pyenv init --path)
export EDITOR="nvim"
source "$HOME/.cargo/env"
export VIRTUAL_ENV_DISABLE_PROMPT=1


# Load all other files
for zsh_file in $HOME/.zsh/*.zsh; do
    source $zsh_file
done

# Load all non-essential environment variables
export $(cat $HOME/.zsh/nonessential.env | xargs)
