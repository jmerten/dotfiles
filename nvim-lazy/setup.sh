#!/bin/bash

# Requirements
# nvim >= 0.10
# ripgrep

echo "Starting setup..."

neovim_version=0.10

dist=$(uname)
case "$dist" in
    Darwin|darwin)
        echo "Darwin (Mac) OS detected"
        # Quietly install dependencies
        brew install -q neovim>=${neovim_version} ripgrep
        ;;
    Arch|arch)
        echo "Arch OS detected"
        # Quietly update pacman and install dependencies
        pacman -Syq neovim>=${neovim_version} ripgrep
        ;;
    *)
        echo "$dist OS not supported"
        exit 1
        ;;
esac

echo "Setup completed successfully!"
