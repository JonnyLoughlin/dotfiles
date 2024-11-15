#!/bin/bash
mkdir -p ~/.dotfiles/hooks
cp ~/.config/scripts/git-hooks/pre-commit.sh ~/.dotfiles/hooks/
chmod +x ~/.dotfiles/hooks/pre-commit.sh
git config --local core.hooksPath ~/.dotfiles/hooks
