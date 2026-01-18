#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    INSTALL_CMD="brew install"
elif command -v apt &> /dev/null; then
    INSTALL_CMD="sudo apt install -y"
else
    INSTALL_CMD=""
fi

if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
    echo "Setting up zsh..."
    ln -sf "$DOTFILES/.zshrc" ~/.zshrc

    # Install autosuggestions
    if [ -n "$INSTALL_CMD" ]; then
        echo "Installing zsh-autosuggestions..."
        $INSTALL_CMD zsh-autosuggestions
    fi

    echo "Done. Run: source ~/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ]; then
    echo "Setting up bash..."
    ln -sf "$DOTFILES/.bashrc" ~/.bashrc
    ln -sf "$DOTFILES/.inputrc" ~/.inputrc
    echo "Done. Run: source ~/.bashrc"
else
    echo "Unknown shell: $SHELL"
    exit 1
fi
