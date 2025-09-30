#!/usr/bin/env bash

# This script builds the devcontainer in the current directory
# installs neovim and starts it.

# SOURCE_DIR is the directory where the script is invoked, not located
SOURCE_DIR="$(pwd)"

devcontainer build . --workspace-folder "$SOURCE_DIR"

devcontainer up --remove-existing-container --mount "type=bind,source=$HOME/.config/nvim,target=/home/vscode/.config/nvim" --workspace-folder "$SOURCE_DIR"

devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "echo >> /home/vscode/.zshrc"
devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c 'echo '\''eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'\'' >> /home/vscode/.zshrc'
devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "brew install neovim"
