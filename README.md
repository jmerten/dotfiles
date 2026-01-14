# Jmert's dotfiles

## Easier dev environment management with `rotz`

> Reference: https://volllly.github.io/rotz/docs/getting-started

We can use `rotz` (`brew install stow`) to help with managing our dev environment using the `dot.yaml` files stored in this repo. In a nutshell, this utility will install dependencies required for the various tools/editors and create symlinks to our dotfiles based on the directory they sit in within the repo.

### Installation
#### Windows
```
brew install volllly/tap/rotz
```

#### MacOS/Linux
```
scoop bucket add volllly https://github.com/volllly/scoop-bucket
scoop install volllly/rotz
```

### Usage

Example:
```
# dotfiles in located in $HOME

rotz install    # installs all tools, and editors
rotz link       # creates symlinks for the dotfiles

# If you only want to install/link a specific directory, use the following
rotz -d ~/dotfiles/editors/vscode link

# If you don't use the full path (`~/dotfiles/editors/vscode`), it will cause issues
```

## nvim

Requirements:
- lua-language-server (`brew install lua-language-server`)
- rust-analyzer (`brew install rustup`, then run `rustup default stable`)
- go/gopls (`brew install go`, then run `go install golang.org/x/tools/gopls@latest`)
- pyright (`brew install pyright`) 

## .zshrc

Requirements: 
- JetBrainsMono NerdFont (`brew install font-jetbrains-mono-nerd-font`)
- oh-my-zsh
    - `zsh-autosuggestions` [link](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew)
    - `zsh-syntax-highlighting` [link](https://github.com/zsh-users/zsh-syntax-highlighting)
- starship
    - Run `starship preset nerd-font-symbols -o ~/.config/starship.toml` for a decent preset

To change the default shell, run `chsh -s /bin/zsh` and make sure you have the `.zshrc` file in place with dependencies installed.

## .wezterm

Requirements:
- JetBrainsMono NerdFont (`brew install font-jetbrains-mono-nerd-font`)
