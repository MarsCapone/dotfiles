
# general settings copied from zshrc
set -xg EDITOR nvim
set -xg VISUAL nvim
set -xg PATH $HOME/bin $PATH

# z settings (like autojump)
set -U Z_CMD "j"
set -U Z_DATA "$HOME/.config/z/config"

# aliases
alias vim='nvim'
alias v='nvim'
alias nv='nvim'
alias update='sudo pacman -Syyu'
alias pacman='sudo pacman --color auto'
alias venv='source ~/dev/venv/bin/activate.fish'
