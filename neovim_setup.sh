#!/bin/bash

set -e

REPO_URL="https://raw.githubusercontent.com/terria1020/my-dev-env/main"
NVIM_CONFIG_DIR="${HOME}/.config/nvim"
BACKUP_SUFFIX="$(date +%Y%m%d%H%M%S)"

printf "\n\nget Neovim IDE template\n"

if [ -d "${NVIM_CONFIG_DIR}" ]; then
  printf "existing config found, backing up to %s.bak.%s\n" "${NVIM_CONFIG_DIR}" "${BACKUP_SUFFIX}"
  mv "${NVIM_CONFIG_DIR}" "${NVIM_CONFIG_DIR}.bak.${BACKUP_SUFFIX}"
fi

mkdir -p "${NVIM_CONFIG_DIR}/lua/plugins"

curl -fsSL "${REPO_URL}/neovim_template/init.lua" -o "${NVIM_CONFIG_DIR}/init.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/options.lua" -o "${NVIM_CONFIG_DIR}/lua/options.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/keymaps.lua" -o "${NVIM_CONFIG_DIR}/lua/keymaps.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/treesitter.lua" -o "${NVIM_CONFIG_DIR}/lua/plugins/treesitter.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/lsp.lua" -o "${NVIM_CONFIG_DIR}/lua/plugins/lsp.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/explorer.lua" -o "${NVIM_CONFIG_DIR}/lua/plugins/explorer.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/telescope.lua" -o "${NVIM_CONFIG_DIR}/lua/plugins/telescope.lua"

if command -v npm >/dev/null 2>&1; then
  printf "\ninstall tree-sitter CLI\n"
  npm install -g tree-sitter-cli
else
  printf "\nnpm not found. install Node.js first, then run: npm install -g tree-sitter-cli\n"
fi

printf "\nsetup is finished!\n"
printf "next step: open nvim and run :Lazy sync\n"
