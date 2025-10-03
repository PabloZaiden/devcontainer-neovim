#!/usr/bin/env bash

# This script starts neovim in a devcontainer environment.

SOURCE_DIR="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_SCRIPT="$SCRIPT_DIR/devcontainer-neovim-build.sh"

# Run the build script to ensure the devcontainer is built and running
bash "$BUILD_SCRIPT"

COMMAND="nvim ."

# if the first argument is --help or -h, show help message
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  echo "Usage: $0 [shell]"
  echo "If 'shell' is provided as an argument, it will open a shell instead of neovim."
  exit 0
fi

# if the first argument is "shell", change the command to zsh
if [ "$1" == "shell" ]; then
  COMMAND="zsh"
fi

devcontainer exec --workspace-folder "$SOURCE_DIR" $COMMAND
