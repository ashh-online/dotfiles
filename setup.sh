#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
    echo "Setting up zsh..."
    ln -sf "$DOTFILES/.zshrc" ~/.zshrc
    echo "Done. Run: source ~/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ]; then
    echo "Setting up bash..."
    ln -sf "$DOTFILES/.bashrc" ~/.bashrc
    echo "Done. Run: source ~/.bashrc"
else
    echo "Unknown shell: $SHELL"
    exit 1
fi
