#!/bin/bash
set -e

REPO="https://raw.githubusercontent.com/ivo9999/homebrew-cld/main"
INSTALL_DIR="${HOME}/.local/bin"

echo "Installing cld..."

# Create install directory
mkdir -p "$INSTALL_DIR"

# Download cld
curl -fsSL "$REPO/cld" -o "$INSTALL_DIR/cld"
chmod +x "$INSTALL_DIR/cld"

# Install zsh completions if zsh is available
if command -v zsh &>/dev/null; then
  ZSH_COMPLETIONS="${HOME}/.zsh/completions"
  mkdir -p "$ZSH_COMPLETIONS"
  curl -fsSL "$REPO/completions/_cld" -o "$ZSH_COMPLETIONS/_cld"

  # Add to fpath if not already there
  if ! grep -q '.zsh/completions' "${HOME}/.zshrc" 2>/dev/null; then
    echo 'fpath=(~/.zsh/completions $fpath)' >> "${HOME}/.zshrc"
    echo 'autoload -Uz compinit && compinit' >> "${HOME}/.zshrc"
  fi
fi

# Check PATH
if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo ""
  echo "Add ~/.local/bin to your PATH if it isn't already:"
  echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

echo ""
echo "Done! Installed cld to $INSTALL_DIR/cld"
echo "Run 'cld help' to get started."
