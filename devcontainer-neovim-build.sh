#!/usr/bin/env bash

# This script builds the devcontainer in the current directory
# and installs neovim .

SOURCE_DIR="$(pwd)"

RUNNING="false"
if devcontainer exec --workspace-folder "$SOURCE_DIR" true 2>/dev/null; then
  echo "✅ Devcontainer is already running"
  RUNNING="true"
fi

if [ "$RUNNING" = "false" ] || [ "$RECREATE" = "true" ]; then
  echo "🚀 Building devcontainer..."
  devcontainer build . --workspace-folder "$SOURCE_DIR"

  devcontainer up --remove-existing-container --mount "type=bind,source=$HOME/.config/nvim,target=/home/vscode/.config/nvim" --workspace-folder "$SOURCE_DIR"

  devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "export NONINTERACTIVE=1 && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "echo >> /home/vscode/.zshrc"
  devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c 'echo '\''eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'\'' >> /home/vscode/.zshrc'
  devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "brew install neovim"
  devcontainer exec --workspace-folder "$SOURCE_DIR" bash -c "brew install tmux"
fi
