#!/bin/bash
mkdir -p ~/.dotfiles/hooks
cp ~/.config/scripts/git-hooks/pre-commit ~/.dotfiles/hooks/
chmod +x ~/.dotfiles/hooks/pre-commit
/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" config core.hooksPath ~/.dotfiles/hooks
