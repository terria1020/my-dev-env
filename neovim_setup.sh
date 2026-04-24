#!/bin/bash

set -e

REPO_URL="https://raw.githubusercontent.com/terria1020/my-dev-env/main"
NVIM_CONFIG_DIR="${HOME}/.config/nvim"
BACKUP_SUFFIX="$(date +%Y%m%d%H%M%S)"

printf "\n\n=== Neovim IDE Setup ===\n\n"

# ── 사전 요구사항 체크 ──
printf "[1/4] Checking prerequisites...\n"

if ! command -v nvim >/dev/null 2>&1; then
  printf "  ERROR: neovim not found. Install first: brew install neovim\n"
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  printf "  ERROR: git not found.\n"
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  printf "  WARNING: npm not found. tree-sitter-cli will not be installed.\n"
  printf "  Install Node.js first, then run: npm install -g tree-sitter-cli\n"
else
  printf "  Installing tree-sitter-cli...\n"
  npm install -g tree-sitter-cli
fi

# Java 21+ 체크 (jdtls 필수)
if command -v /usr/libexec/java_home >/dev/null 2>&1; then
  JAVA21_HOME=$(/usr/libexec/java_home -v 21 2>/dev/null || true)
  if [ -z "${JAVA21_HOME}" ]; then
    printf "  WARNING: Java 21+ not found. jdtls (Java LSP) requires Java 21+.\n"
    printf "  Install: brew install --cask zulu@21\n"
  else
    printf "  Java 21 found: %s\n" "${JAVA21_HOME}"
  fi
fi

# ── 기존 설정 백업 ──
printf "\n[2/4] Preparing config directory...\n"

if [ -d "${NVIM_CONFIG_DIR}" ]; then
  printf "  Backing up existing config to %s.bak.%s\n" "${NVIM_CONFIG_DIR}" "${BACKUP_SUFFIX}"
  mv "${NVIM_CONFIG_DIR}" "${NVIM_CONFIG_DIR}.bak.${BACKUP_SUFFIX}"
fi

mkdir -p "${NVIM_CONFIG_DIR}/lua/plugins"

# ── 템플릿 다운로드 ──
printf "\n[3/4] Downloading config files...\n"

curl -fsSL "${REPO_URL}/neovim_template/init.lua"                    -o "${NVIM_CONFIG_DIR}/init.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/options.lua"             -o "${NVIM_CONFIG_DIR}/lua/options.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/keymaps.lua"             -o "${NVIM_CONFIG_DIR}/lua/keymaps.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/treesitter.lua"  -o "${NVIM_CONFIG_DIR}/lua/plugins/treesitter.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/lsp.lua"         -o "${NVIM_CONFIG_DIR}/lua/plugins/lsp.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/explorer.lua"    -o "${NVIM_CONFIG_DIR}/lua/plugins/explorer.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/telescope.lua"   -o "${NVIM_CONFIG_DIR}/lua/plugins/telescope.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/formatting.lua"  -o "${NVIM_CONFIG_DIR}/lua/plugins/formatting.lua"
curl -fsSL "${REPO_URL}/neovim_template/lua/plugins/autopairs.lua"   -o "${NVIM_CONFIG_DIR}/lua/plugins/autopairs.lua"

printf "  Done.\n"

# ── 포매터 설치 (Mason 경유) ──
printf "\n[4/4] Post-install notes\n"
printf "  1. Open nvim and run :Lazy sync\n"
printf "  2. Install formatters inside nvim:\n"
printf "     :MasonInstall prettier black stylua shfmt google-java-format\n"
printf "  3. Or install via system package manager:\n"
printf "     npm install -g prettier\n"
printf "     pip install black\n"
printf "     brew install stylua shfmt google-java-format\n"

printf "\n=== Setup complete! ===\n"
