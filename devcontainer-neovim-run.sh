#!/usr/bin/env bash

# This script starts neovim in a devcontainer environment.

SOURCE_DIR="$(pwd)"

devcontainer exec --workspace-folder "$SOURCE_DIR" nvim .
