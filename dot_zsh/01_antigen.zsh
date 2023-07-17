ANTIGEN_PATH=$HOME/.zsh/external

if [ ! -f $ANTIGEN_PATH/antigen.zsh ]; then
    mkdir -p $ANTIGEN_PATH
    echo "Downloading antigen.zsh"
    curl -L git.io/antigen > $ANTIGEN_PATH/antigen.zsh
fi

source $HOME/.zsh/external/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOF
    safe-paste
    history
    command-not-found
    colorize
    colored-man-pages
    brew
    macos
    
    pyenv
    pip
    python
    jenv
    rbenv
    git
    autojump

    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOF

antigen apply
