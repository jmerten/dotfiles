# Jmert's dotfiles

## Easy dotfile management with `stow`

> Reference: https://gist.github.com/andreibosco/cb8506780d0942a712fc

We can use `stow` (`brew install stow`) to help with managing the dotfiles stored in this repo. In a nutshell, this utility will create symlinks to our dotfiles based on the directory they sit in within the repo.

Example:
```
# dotfiles in located in $HOME

stow zsh    # stores the .zshrc file to $HOME/.zshrc
stow nvim   # stores the nvim folder to $HOME/.config/nvim
```

You can modify the destination directory of the folder with the following:
```
stow <folder> -t <target>

# Example
stow wezterm -t ../test
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
