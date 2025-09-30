# Devcontainers for Neovim

This repository contains a collection of scripts to build and run devcontainers, install Neovim in them and mount the current user's neovim configuration.

## Usage

- Make sure that this directory is in the path:

```bash
export PATH="$PATH:/path/to/this/repo"
```

- Go to the directory you want to work in and run:

```bash
# Only the first time
devcontainer-neovim-build.sh

# To start neovim in the devcontainer
devcontainer-neovim-run.sh
```
