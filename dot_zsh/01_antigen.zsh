ANTIGEN_PATH=$HOME/.zsh/external

if [ ! -f $ANTIGEN_PATH/antigen.zsh ]; then
    mkdir -p $ANTIGEN_PATH
    echo "Downloading antigen.zsh"
    curl -L git.io/antigen > $ANTIGEN_PATH/antigen.zsh
fi

source $HOME/.zsh/external/antigen.zsh

antigen use oh-my-zsh
antigen bundle safe-paste
antigen bundle history
antigen bundle command-not-found
antigen bundle colorize
antigen bundle colored-man-pages

antigen bundle pyenv
antigen bundle pip
antigen bundle python

antigen bundle jenv

antigen bundle brew
antigen bundle macos

antigen bundle git
antigen bundle autojump

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
