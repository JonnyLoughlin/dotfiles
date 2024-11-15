#!/bin/bash
echo "Setting up package tracking pre-commit hooks..." >&2
mkdir -p ~/.dotfiles/hooks
cp ~/.config/scripts/git-hooks/pre-commit ~/.dotfiles/hooks/
chmod +x ~/.dotfiles/hooks/pre-commit
/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" config core.hooksPath ~/.dotfiles/hooks
