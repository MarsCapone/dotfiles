# MacOS dotfiles

A zsh config managed by [chezmoi](https://www.chezmoi.io/quick-start)

Main components:

* antigen: https://github.com/zsh-users/antigen
* Starship: https://starship.rs/

## Getting Started

### On a new machine

```
chezmoi init --apply $GITHUB_USERNAME
```

### On an existing machine

1. Install `chezmoi`
```
brew install chezmoi
```
2. Initialise from this repo
```
chezmoi init https://github.com/MarsCapone/dotfiles.git
```
3. Check what changes that chezmoi will make to your home directory by running:
```
chezmoi diff
```
4. If you are happy with the changes that chezmoi will make then run:
```
chezmoi apply -v
```
